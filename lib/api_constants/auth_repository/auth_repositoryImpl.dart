import 'package:box_app/api_constants/login.dart';

import 'package:box_app/core/errors/failures.dart';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/errors/exceptions.dart';
import '../date/auth_remote_data_source.dart';
import 'auth_repository.dart';
@Injectable(as:AuthRepository)

class AuthRepositoryImpl extends AuthRepository
{
  final AuthRemoteDataSource authRemoteDataSource;


  AuthRepositoryImpl({
    required this.authRemoteDataSource,
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


}

