import 'package:box_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

import '../models/zone_location_model.dart';
import '../params/select_location_param.dart';
import '../params/update_location_param.dart';

abstract class SelectLocationRepository {
  Future<Either<Failure, ZoneLocationModel>> checkTechZone({
    required SelectLocationParam param,
  });
  
  Future<Either<Failure, String>> updateLocation({
    required UpdateLocationParam param,
    required String token,
  });
}
