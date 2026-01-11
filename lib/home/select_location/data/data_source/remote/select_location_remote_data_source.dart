import '../../models/zone_location_model.dart';
import '../../params/select_location_param.dart';
import '../../params/update_location_param.dart';

abstract class SelectLocationRemoteDataSource {
  Future<ZoneLocationModel> checkTechZone({required SelectLocationParam param});
  
  Future<String> updateLocation({
    required UpdateLocationParam param,
    required String token,
  });
}
