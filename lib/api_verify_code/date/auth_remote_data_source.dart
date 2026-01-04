import 'package:box_app/api_constants/auth_repository/token_and_first_login_model.dart';
import 'package:box_app/api_constants/login.dart';
import 'package:box_app/api_verify_code/active_acc_param.dart';

import '../../api_verify_code/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<String> loginAndResendCode({
    required LoginParameter param,
  });

  Future<TokenAndFirstLoginModel<String>> activeAcc({
    required ActiveAccParameter param,
  });
  Future<UserModel> authUser({required String token});

}
