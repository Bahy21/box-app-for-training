// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:box_app/core/api/api_consumer.dart' as _i550;
import 'package:box_app/core/api/dio_consumer.dart' as _i577;
import 'package:box_app/core/api/dio_log_interceptor.dart' as _i342;
import 'package:box_app/core/api/network_info.dart' as _i235;
import 'package:box_app/core/di/di_module.dart' as _i1073;
import 'package:box_app/core/framework/app_firebase.dart' as _i861;
import 'package:box_app/core/framework/app_notification.dart' as _i231;
import 'package:box_app/core/framework/device_info.dart' as _i227;
import 'package:box_app/core/framework/theme_cubit.dart' as _i21;
import 'package:box_app/core/helpers/image_helper.dart' as _i596;
import 'package:box_app/core/helpers/psermission_services.dart' as _i82;
import 'package:box_app/core/local/shared_preferences/shared_pref_services.dart'
    as _i825;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:image_picker/image_picker.dart' as _i183;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart'
    as _i161;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectionModule = _$InjectionModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => injectionModule.prefs,
      preResolve: true,
    );
    gh.factory<_i161.InternetConnection>(
        () => injectionModule.internetConnection);
    gh.factory<_i361.Dio>(() => injectionModule.dioClient);
    gh.factory<_i183.ImagePicker>(() => injectionModule.imagePicker);
    gh.factory<_i227.DeviceInfo>(() => _i227.DeviceInfo());
    gh.factory<_i231.AppNotifications>(() => _i231.AppNotifications());
    gh.factory<_i596.DocumentHelper>(() => _i596.DocumentHelper());
    gh.factory<_i82.PermissionServices>(() => _i82.PermissionServices());
    gh.lazySingleton<_i342.DioLogInterceptor>(() => _i342.DioLogInterceptor());
    gh.lazySingleton<_i825.SharedPrefServices>(() => _i825.SharedPrefServices(
        sharedPreferences: gh<_i460.SharedPreferences>()));
    gh.factory<_i861.AppFirebase>(() =>
        _i861.AppFirebase(appNotifications: gh<_i231.AppNotifications>()));
    gh.factory<_i235.NetworkInfo>(() => _i235.NetworkInfoImpl(
        internetConnection: gh<_i161.InternetConnection>()));
    gh.lazySingleton<_i21.ThemeCubit>(
        () => _i21.ThemeCubit(gh<_i825.SharedPrefServices>()));
    gh.lazySingleton<_i550.ApiConsumer>(() => _i577.DioApiConsumer(
          networkInfo: gh<_i235.NetworkInfo>(),
          dioClient: gh<_i361.Dio>(),
          appPref: gh<_i825.SharedPrefServices>(),
        ));
    return this;
  }
}

class _$InjectionModule extends _i1073.InjectionModule {}
