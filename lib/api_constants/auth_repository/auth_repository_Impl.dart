import 'package:box_app/api_constants/auth_repository/token_and_first_login_model.dart';
import 'package:box_app/api_constants/login.dart';
import 'package:box_app/api_verify_code/active_acc_param.dart';
import 'package:box_app/api_verify_code/user_model.dart';

import 'package:box_app/core/errors/failures.dart';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../api_verify_code/date/auth_remote_data_source.dart';
import '../../api_verify_code/local/auth_local_data_source.dart';
import '../../core/errors/exceptions.dart';
import 'auth_repository.dart';
@Injectable(as:AuthRepository)

class AuthRepositoryImpl extends AuthRepository
{
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;



  AuthRepositoryImpl({
    required this.authRemoteDataSource,
    required this.authLocalDataSource,
  });

  @override
  Future<Either<Failure, String>> loginAndResendCode({
    required LoginParameter param,
  }) async {
    try {
      String message = await authRemoteDataSource.loginAndResendCode(
        param: param,
      );
      return Right(message);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    }
  }
  @override
  Future<Either<Failure, TokenAndFirstLoginModel<String>>> activeAcc({
    required ActiveAccParameter param,
  }) async {
    try {
      TokenAndFirstLoginModel<String> model = await authRemoteDataSource
          .activeAcc(param: param);
      return Right(model);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    }
  }
  @override
  Future<Either<Failure, UserModel>> authUser({required String token}) async {
    try {
      UserModel model = await authRemoteDataSource.authUser(token: token);
      return Right(model);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    }
  }


  @override
  Either<Failure, dynamic> saveUserData({
    required UserModel user,
    required String token,
  }) {
    try {
      authLocalDataSource.saveDataUser(user: user, token: token);
      return const Right('Done');
    } on CacheException catch (exception) {
      return Left(CacheFailure(exception.message!));
    }
  }
}
