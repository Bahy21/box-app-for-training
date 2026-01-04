import 'package:box_app/api_constants/auth_repository/token_and_first_login_model.dart';
import 'package:box_app/api_constants/login.dart';
import 'package:box_app/api_verify_code/active_acc_param.dart';
import 'package:dartz/dartz.dart';

import '../../api_verify_code/user_model.dart';
import '../../core/errors/failures.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> loginAndResendCode({
    required LoginParameter param,
  });

  Future<Either<Failure, TokenAndFirstLoginModel<String>>> activeAcc({
    required ActiveAccParameter param,
  });

  Future<Either<Failure, UserModel>> authUser({required String token});

  Either<Failure, dynamic> saveUserData({
    required UserModel user,
    required String token,
  });
}
