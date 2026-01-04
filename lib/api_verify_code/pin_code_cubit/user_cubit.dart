import 'dart:convert';

import 'package:box_app/core/constants/app_cached.dart';
import 'package:box_app/core/local/shared_preferences/shared_pref_services.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../user_model.dart';

part 'user_state.dart';

@lazySingleton
class UserCubit extends Cubit<UserState> {
  final SharedPrefServices appPref;

  UserCubit(this.appPref) : super(UserInitial()) {
    _loadUserData();
  }

  UserModel? _user;
  String? _token;

  UserModel? get user => _user;
  String? get token => _token;

  bool get isLoggedIn => _token != null && _token!.isNotEmpty && _user != null;

  Future<void> _loadUserData() async {
    try {
      String? savedToken = appPref.getData(key: AppCached.token);
      String? savedUserData = appPref.getData(key: AppCached.userData);

      if (savedToken != null && savedToken.isNotEmpty) {
        _token = savedToken;

        // Load user data from SharedPreferences if available
        if (savedUserData != null && savedUserData.isNotEmpty) {
          try {
            Map<String, dynamic> userJson = json.decode(savedUserData);
            _user = UserModel.fromJson(userJson);
            emit(UserLoaded(user: _user, token: savedToken));
          } catch (e) {
            // If parsing fails, just load token
            emit(UserLoaded(token: savedToken));
          }
        } else {
          emit(UserLoaded(token: savedToken));
        }
      } else {
        emit(UserInitial());
      }
    } catch (e) {
      emit(UserInitial());
    }
  }

  Future<void> setUser({
    required UserModel user,
    required String token,
  }) async {
    try {
      _user = user;
      _token = token;
      String userJson = json.encode(user.toJson());
      await Future.wait([
        appPref.saveData(AppCached.token, token),
        appPref.saveData(AppCached.userData, userJson),
        appPref.saveData(AppCached.userId, user.id.toString()),
        if (user.role != null) appPref.saveData(AppCached.role, user.role!),
        if (user.isOnline != null)
          appPref.saveData(AppCached.isOnline, user.isOnline!),
      ]);

      emit(UserLoaded(user: user, token: token));
    } catch (e) {
      emit(UserError(error: e.toString()));
    }
  }

  Future<void> updateUser(UserModel user) async {
    try {
      _user = user;
      String userJson = json.encode(user.toJson());
      await Future.wait([
        appPref.saveData(AppCached.userData, userJson),
        appPref.saveData(AppCached.userId, user.id.toString()),
        if (user.role != null) appPref.saveData(AppCached.role, user.role!),
        if (user.isOnline != null)
          appPref.saveData(AppCached.isOnline, user.isOnline!),
      ]);

      emit(UserLoaded(user: user, token: _token));
    } catch (e) {
      emit(UserError(error: e.toString()));
    }
  }

  Future<void> clearUser() async {
    try {
      _user = null;
      _token = null;
      await Future.wait([
        appPref.removeData(key: AppCached.token),
        appPref.removeData(key: AppCached.userData),
        appPref.removeData(key: AppCached.userId),
        appPref.removeData(key: AppCached.role),
        appPref.removeData(key: AppCached.isOnline),
      ]);

      emit(UserInitial());
    } catch (e) {
      emit(UserError(error: e.toString()));
    }
  }

  Future<void> updateToken(String token) async {
    try {
      _token = token;
      await appPref.saveData(AppCached.token, token);
      emit(UserLoaded(user: _user, token: token));
    } catch (e) {
      emit(UserError(error: e.toString()));
    }
  }
}

