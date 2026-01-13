import 'package:box_app/core/errors/exceptions.dart';
import 'package:box_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../api_verify_code/pin_code_cubit/models/city_model.dart';
import '../models/register_response_model.dart';
import '../params/create_acc_user_param.dart';
import '../remote/create_acc_user_remote_data_source.dart';
import 'create_acc_user_repository.dart';

@Injectable(as: CreateAccUserRepository)
class CreateAccUserRepositoryImpl extends CreateAccUserRepository {
  final CreateAccUserRemoteDataSource createAccUserRemoteDataSource;

  CreateAccUserRepositoryImpl({required this.createAccUserRemoteDataSource});

  @override
  Future<Either<Failure, RegisterResponseModel>> createAcc({
    required CreateAccUserParam param,
    required String token,
  }) async {
    try {
      RegisterResponseModel response =
          await createAccUserRemoteDataSource.createAcc(
        param: param,
        token: token,
      );
      return Right(response);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, List<CityModel>>> fetchCities() async {
    try {
      List<CityModel> cities =
          await createAccUserRemoteDataSource.fetchCities();
      return Right(cities);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    }
  }
}
