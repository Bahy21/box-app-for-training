import 'package:box_app/core/constants/app_cached.dart';
import 'package:box_app/core/errors/exceptions.dart';
import 'package:box_app/core/local/shared_preferences/shared_pref_services.dart';
import 'package:injectable/injectable.dart';

import '../user_model.dart';
import 'auth_local_data_source.dart';

@Injectable(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  final SharedPrefServices appPref;

  AuthLocalDataSourceImpl({required this.appPref});

  @override
  void saveDataUser({required UserModel user, required String token}) {
    try {
      Future.wait([
        appPref.saveData(AppCached.role, user.role ?? ''),
        appPref.saveData(AppCached.userId, user.id.toString()),
        appPref.saveData(AppCached.isOnline, user.isOnline ?? false),
        appPref.saveData(AppCached.token, token),
      ]);
    } catch (error) {
      throw CacheSaveException();
    }
  }
}
