import 'package:box_app/core/errors/exceptions.dart';
import 'package:box_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../data_source/remote/select_location_remote_data_source.dart';
import '../models/zone_location_model.dart';
import '../params/select_location_param.dart';
import '../params/update_location_param.dart';
import 'select_location_repository.dart';

@Injectable(as: SelectLocationRepository)
class SelectLocationRepositoryImpl extends SelectLocationRepository {
  final SelectLocationRemoteDataSource remoteDataSource;

  SelectLocationRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, ZoneLocationModel>> checkTechZone({
    required SelectLocationParam param,
  }) async {
    try {
      ZoneLocationModel model = await remoteDataSource.checkTechZone(
        param: param,
      );
      return Right(model);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, String>> updateLocation({
    required UpdateLocationParam param,
    required String token,
  }) async {
    try {
      String message = await remoteDataSource.updateLocation(
        param: param,
        token: token,
      );
      return Right(message);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    }
  }
}
