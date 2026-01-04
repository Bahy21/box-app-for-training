import 'package:box_app/api_verify_code/repository/setting_repository.dart';
import 'package:box_app/core/errors/exceptions.dart';
import 'package:box_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../local/setting_local_data_source.dart';
import '../parms/lang_param.dart';
import '../parms/update_profile_param.dart';
import '../pin_code_cubit/models/loyalty_points_model.dart';
import '../pin_code_cubit/models/social_media_model.dart';
import '../remote/setting_remote_data_source.dart';
import '../user_model.dart';

@Injectable(as: SettingRepository)
class SettingRepositoryImpl extends SettingRepository {
  final SettingRemoteDataSource settingRemoteDataSource;

  final SettingLocalDataSource settingLocalDataSource;

  SettingRepositoryImpl({
    required this.settingRemoteDataSource,
    required this.settingLocalDataSource,
  });

  @override
  Either<Failure, dynamic> clearDataUser() {
    try {
      settingLocalDataSource.clearDataUser();
      return const Right('Done');
    } on CacheException catch (exception) {
      return Left(CacheFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, String>> deleteAcc() async {
    try {
      String message = await settingRemoteDataSource.deleteAcc();
      return Right(message);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, String>> logOut() async {
    try {
      String message = await settingRemoteDataSource.logOut();
      return Right(message);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, String>> toggleNotification() async {
    try {
      String message = await settingRemoteDataSource.toggleNotification();
      return Right(message);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, SocialMediaModel>> fetchSocialMedias() async {
    try {
      SocialMediaModel model =
          await settingRemoteDataSource.fetchSocialMedias();
      return Right(model);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, UserModel>> fetchUserAuth() async {
    try {
      UserModel model = await settingRemoteDataSource.authUser();
      return Right(model);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, String>> changeLang({
    required LangParam param,
    String? token,
  }) async {
    try {
      String message = await settingRemoteDataSource.changeLang(
        param: param,
        token: token,
      );
      return Right(message);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, UserModel>> updateProfile({
    required UpdateProfileParam param,
    required String token,
  }) async {
    try {
      UserModel user = await settingRemoteDataSource.updateProfile(
        param: param,
        token: token,
      );
      return Right(user);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, LoyaltyPointsModel>> getLoyaltyPoints() async {
    try {
      LoyaltyPointsModel model =
          await settingRemoteDataSource.getLoyaltyPoints();
      return Right(model);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    }
  }
}
