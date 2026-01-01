import 'package:box_app/api_constants/login.dart';
import 'package:injectable/injectable.dart';

import '../../core/api/api_consumer.dart';
import '../../core/api/base_response.dart';
import '../../core/constants/api_constants.dart';
import '../../core/errors/exceptions.dart';
import 'auth_remote_data_source.dart';
@Injectable(as:AuthRemoteDataSource )

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final ApiConsumer apiConsumer;

  AuthRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<String> loginAndResendCode({required LoginParameter param}) async {
    BaseResponse response = await apiConsumer.post(
      ApiConstants.login,
      body: param.toJson(),
    );
    if (response.status == true) {
      return response.message;
      ///Exception
    } else {
      throw ServerException(response.message.toString());
    }
  }
  }

