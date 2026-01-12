import '../../../../api_verify_code/pin_code_cubit/models/city_model.dart';
import '../models/register_response_model.dart';
import '../params/create_acc_user_param.dart';

abstract class CreateAccUserRemoteDataSource {
  Future<RegisterResponseModel> createAcc({
    required CreateAccUserParam param,
    required String token,
  });

  Future<List<CityModel>> fetchCities();
}
