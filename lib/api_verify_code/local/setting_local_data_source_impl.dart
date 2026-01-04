import 'package:box_app/api_verify_code/local/setting_local_data_source.dart';
import 'package:box_app/core/constants/app_cached.dart';
import 'package:box_app/core/errors/exceptions.dart';
import 'package:box_app/core/local/shared_preferences/shared_pref_services.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SettingLocalDataSource)
class SettingLocalDataSourceImpl extends SettingLocalDataSource {
  final SharedPrefServices appPref;

  SettingLocalDataSourceImpl({required this.appPref});

  @override
  void clearDataUser() {
    try {
      Future.wait([
        appPref.removeData(key: AppCached.role),
        appPref.removeData(key: AppCached.userId),
        appPref.removeData(key: AppCached.isOnline),
        appPref.removeData(key: AppCached.token),
      ]);
    } catch (error) {
      throw CacheSaveException();
    }
  }
}
