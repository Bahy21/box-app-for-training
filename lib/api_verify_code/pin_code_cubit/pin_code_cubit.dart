import 'dart:async';

import 'package:box_app/api_constants/login.dart';
import 'package:box_app/api_verify_code/active_acc_param.dart';
import 'package:box_app/api_verify_code/pin_code_cubit/user_cubit.dart';
import 'package:box_app/core/util/extensions/navigation.dart';
import 'package:box_app/core/util/routing/routes.dart';
import 'package:box_app/core/widgets/custom_toast.dart';
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

import '../../api_constants/auth_repository/auth_repository.dart';
import '../../api_constants/auth_repository/token_and_first_login_model.dart';
import '../lang_param.dart';
import '../setting_repository.dart';
import '../user_model.dart';


part 'pin_code_state.dart';

@injectable
class PinCodeCubit extends Cubit<PinCodeState> {
  final AuthRepository repository;
  final SettingRepository settingRepository;
  final UserCubit userCubit;

  PinCodeCubit(this.repository, this.settingRepository, this.userCubit)
      : super(PinCodeInitial());

  final pinCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();
  UserModel? userModel;
  TokenAndFirstLoginModel<String>? tokenLoginModel;

  void resendCode({
    required VoidCallback timer,
    required LoginParameter param,
  }) async {
    emit(ResendCodeLoading());
    var result = await repository.loginAndResendCode(param: param);
    result.fold(
          (failure) {
        showToast(text: failure.message, state: ToastStates.error);
        emit(PinCodeFailure());
      },
          (message) {
        timer();
        emit(PinCodeSuccess());
      },
    );
  }

  void activeAcc({
    required BuildContext context,
    required bool isUser,
    required ActiveAccParameter param,
  }) async {
    emit(PinCodeLoading());
    var result = await repository.activeAcc(param: param);
    result.fold(
          (failure) {
        showToast(text: failure.message, state: ToastStates.error);
        emit(PinCodeFailure());
      },
          (TokenAndFirstLoginModel<String>? tokenLoginModel) async {
        this.tokenLoginModel = tokenLoginModel;
        if (tokenLoginModel!.firstLogin == false) {
          if (tokenLoginModel.user != null) {
            await userCubit.setUser(
              user: tokenLoginModel.user!,
              token: tokenLoginModel.token,
            );
            context.pushAndRemoveUntilWithNamed(Routes.homeView);
            emit(PinCodeSuccess());
          } else {
            userAuth(token: tokenLoginModel.token, context: context);
          }
        } else {
          emit(FirstLoginSuccess(
            token: tokenLoginModel.token,
            isUser: isUser,
          ));
        }
      },
    );
  }

  void changeLang({
    required BuildContext context,
    required UserModel user,
    required String token,
  }) async {
    emit(PinCodeLoading());
    var result = await settingRepository.changeLang(
      param: LangParam(lang: context.locale.languageCode),
      token: token,
    );
    result.fold((failure) {
      showToast(text: failure.message, state: ToastStates.error);
      emit(ChangeLangFailure());
    }, (msg) => saveDataUser(context: context, token: token, user: user));
  }

  void userAuth({required String token, required BuildContext context}) async {
    emit(PinCodeLoading());
    var result = await repository.authUser(token: token);
    result.fold(
          (failure) {
        showToast(text: failure.message, state: ToastStates.error);
        emit(AuthUserFailure());
      },
          (UserModel userModel) {
        this.userModel = userModel;
        changeLang(context: context, user: userModel, token: token);
      },
    );
  }

  void saveDataUser({
    required UserModel user,
    required String token,
    required BuildContext context,
  }) async {
    emit(PinCodeLoading());

    // Save to UserCubit (which also saves to SharedPreferences) - await to ensure it's saved
    await userCubit.setUser(user: user, token: token);

    // Also save via repository for backward compatibility
    var result = repository.saveUserData(user: user, token: token);
    result.fold(
          (failure) {
        showToast(text: failure.message, state: ToastStates.error);
        emit(SaveDataFailure());
      },
          (r) {
        context.pushAndRemoveUntilWithNamed(Routes.homeView);
        emit(PinCodeSuccess());
      },
    );
  }

  @override
  Future<void> close() {
    pinCtrl.dispose();
    return super.close();
  }
}
