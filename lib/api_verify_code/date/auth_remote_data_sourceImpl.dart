import 'package:box_app/api_constants/auth_repository/token_and_first_login_model.dart';
import 'package:box_app/api_constants/login.dart';
import 'package:box_app/api_verify_code/active_acc_param.dart';
import 'package:injectable/injectable.dart';

import '../../api_verify_code/user_model.dart';
import '../../core/api/api_consumer.dart';
import '../../core/api/base_response.dart';
import '../../core/constants/api_constants.dart';
import '../../core/errors/exceptions.dart';
import 'auth_remote_data_source.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiConsumer apiConsumer;


  AuthRemoteDataSourceImpl({
    required this.apiConsumer,
  });

  @override
  Future<String> loginAndResendCode({
    required LoginParameter param,
  }) async {
    BaseResponse response = await apiConsumer.post(
      ApiConstants.login,
      body: param.toJson(),
    );

    if (response.status == true) {
      return response.message;
    } else {
      ///throw معناها ان في مشكله حصلت
      throw ServerException(response.message.toString());
    }
  }

  @override
  Future<TokenAndFirstLoginModel<String>> activeAcc({
    required ActiveAccParameter param,
  }) async {
    BaseResponse response = await apiConsumer.post(
      ApiConstants.activeAcc,
      body: param.toJson(),
    );

    if (response.status == true) {
      return TokenAndFirstLoginModel<String>.fromJson(
        response.data,
            (json) => json as String,
      );
    } else {
      throw ServerException(response.message.toString());
    }
  }


  @override
  Future<UserModel> authUser({required String token}) async {
    BaseResponse response = await apiConsumer.get(
      ApiConstants.authUser,
      token: token,
    );
    if (response.status == true) {
      return UserModel.fromJson(response.data);
    } else {
      throw ServerException(response.message.toString());
    }
  }
}
