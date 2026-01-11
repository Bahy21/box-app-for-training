import 'package:box_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

import '../../../../api_verify_code/pin_code_cubit/models/city_model.dart';
import '../models/register_response_model.dart';
import '../params/create_acc_user_param.dart';

abstract class CreateAccUserRepository {
  Future<Either<Failure, List<CityModel>>> fetchCities();

  Future<Either<Failure, RegisterResponseModel>> createAcc({
    required CreateAccUserParam param,
    required String token,
  });
}
