import 'package:box_app/core/api/api_consumer.dart';
import 'package:box_app/core/api/base_response.dart';
import 'package:box_app/core/constants/api_constants.dart';
import 'package:box_app/core/errors/exceptions.dart';
import 'package:injectable/injectable.dart';
import '../../../../api_verify_code/pin_code_cubit/models/city_model.dart';
import '../models/register_response_model.dart';
import '../params/create_acc_user_param.dart';
import 'create_acc_user_remote_data_source.dart';

@Injectable(as: CreateAccUserRemoteDataSource)
class CreateAccUserRemoteDataSourceImpl extends CreateAccUserRemoteDataSource {
  final ApiConsumer apiConsumer;

  CreateAccUserRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<RegisterResponseModel> createAcc({
    required CreateAccUserParam param,
    required String token,
  }) async {
    BaseResponse response = await apiConsumer.post(
      ApiConstants.completeRegistration,
      body: param.toJson(),
      token: token,
    );
    if (response.status == true) {
      return RegisterResponseModel.fromJson(response.data);
    } else {
      throw ServerException(response.message.toString());
    }
  }

  @override
  Future<List<CityModel>> fetchCities() async {
    BaseResponse response = await apiConsumer.get(ApiConstants.cities);
    if (response.status == true) {
      List<CityModel> cities = (response.data as List)
          .map<CityModel>((json) => CityModel.fromJson(json))
          .toList();
      return cities;
    } else {
      throw ServerException(response.message.toString());
    }
  }
}
