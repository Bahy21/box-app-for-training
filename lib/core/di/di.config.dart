// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:box_app/api_constants/auth_repository/auth_repository.dart'
    as _i282;
import 'package:box_app/api_constants/auth_repository/auth_repository_Impl.dart'
    as _i877;
import 'package:box_app/api_verify_code/date/auth_remote_data_source.dart'
    as _i690;
import 'package:box_app/api_verify_code/date/auth_remote_data_sourceImpl.dart'
    as _i258;
import 'package:box_app/api_verify_code/local/auth_local_data_source.dart'
    as _i145;
import 'package:box_app/api_verify_code/local/auth_local_data_source_Impl.dart'
    as _i27;
import 'package:box_app/api_verify_code/local/setting_local_data_source.dart'
    as _i649;
import 'package:box_app/api_verify_code/local/setting_local_data_source_impl.dart'
    as _i1008;
import 'package:box_app/api_verify_code/pin_code_cubit/pin_code_cubit.dart'
    as _i232;
import 'package:box_app/api_verify_code/pin_code_cubit/user_cubit.dart'
    as _i224;
import 'package:box_app/api_verify_code/remote/setting_remote_data_source.dart'
    as _i772;
import 'package:box_app/api_verify_code/remote/setting_remote_data_source_impl.dart'
    as _i940;
import 'package:box_app/api_verify_code/repository/setting_repository.dart'
    as _i894;
import 'package:box_app/api_verify_code/repository/setting_repository_impl.dart'
    as _i977;
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
import 'package:box_app/home/login_page/cubit/login_cubit/login_cubit.dart'
    as _i222;
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
    gh.factory<_i231.AppNotifications>(() => _i231.AppNotifications());
    gh.factory<_i227.DeviceInfo>(() => _i227.DeviceInfo());
    gh.factory<_i596.DocumentHelper>(() => _i596.DocumentHelper());
    gh.factory<_i82.PermissionServices>(() => _i82.PermissionServices());
    gh.lazySingleton<_i342.DioLogInterceptor>(() => _i342.DioLogInterceptor());
    gh.lazySingleton<_i825.SharedPrefServices>(() => _i825.SharedPrefServices(
        sharedPreferences: gh<_i460.SharedPreferences>()));
    gh.factory<_i861.AppFirebase>(() =>
        _i861.AppFirebase(appNotifications: gh<_i231.AppNotifications>()));
    gh.factory<_i235.NetworkInfo>(() => _i235.NetworkInfoImpl(
        internetConnection: gh<_i161.InternetConnection>()));
    gh.factory<_i649.SettingLocalDataSource>(() =>
        _i1008.SettingLocalDataSourceImpl(
            appPref: gh<_i825.SharedPrefServices>()));
    gh.lazySingleton<_i21.ThemeCubit>(
        () => _i21.ThemeCubit(gh<_i825.SharedPrefServices>()));
    gh.lazySingleton<_i224.UserCubit>(
        () => _i224.UserCubit(gh<_i825.SharedPrefServices>()));
    gh.lazySingleton<_i550.ApiConsumer>(() => _i577.DioApiConsumer(
          networkInfo: gh<_i235.NetworkInfo>(),
          dioClient: gh<_i361.Dio>(),
          appPref: gh<_i825.SharedPrefServices>(),
        ));
    gh.factory<_i772.SettingRemoteDataSource>(() =>
        _i940.SettingRemoteDataSourceImpl(
            apiConsumer: gh<_i550.ApiConsumer>()));
    gh.factory<_i145.AuthLocalDataSource>(() =>
        _i27.AuthLocalDataSourceImpl(appPref: gh<_i825.SharedPrefServices>()));
    gh.factory<_i894.SettingRepository>(() => _i977.SettingRepositoryImpl(
          settingRemoteDataSource: gh<_i772.SettingRemoteDataSource>(),
          settingLocalDataSource: gh<_i649.SettingLocalDataSource>(),
        ));
    gh.factory<_i690.AuthRemoteDataSource>(() =>
        _i258.AuthRemoteDataSourceImpl(apiConsumer: gh<_i550.ApiConsumer>()));
    gh.factory<_i282.AuthRepository>(() => _i877.AuthRepositoryImpl(
          authRemoteDataSource: gh<_i690.AuthRemoteDataSource>(),
          authLocalDataSource: gh<_i145.AuthLocalDataSource>(),
        ));
    gh.factory<_i222.LoginCubit>(() => _i222.LoginCubit(
          gh<_i282.AuthRepository>(),
          gh<_i861.AppFirebase>(),
          gh<_i227.DeviceInfo>(),
        ));
    gh.factory<_i232.PinCodeCubit>(() => _i232.PinCodeCubit(
          gh<_i282.AuthRepository>(),
          gh<_i894.SettingRepository>(),
          gh<_i224.UserCubit>(),
        ));
    return this;
  }
}

class _$InjectionModule extends _i1073.InjectionModule {}
