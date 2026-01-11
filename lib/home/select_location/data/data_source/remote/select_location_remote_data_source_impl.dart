import 'dart:io';

import 'package:box_app/core/api/api_consumer.dart';
import 'package:box_app/core/api/base_response.dart';
import 'package:box_app/core/constants/api_constants.dart';
import 'package:box_app/core/errors/exceptions.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../models/zone_location_model.dart';
import '../../params/select_location_param.dart';
import '../../params/update_location_param.dart';
import 'select_location_remote_data_source.dart';

@Injectable(as: SelectLocationRemoteDataSource)
class SelectLocationRemoteDataSourceImpl
    extends SelectLocationRemoteDataSource {
  final ApiConsumer apiConsumer;

  SelectLocationRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<ZoneLocationModel> checkTechZone({
    required SelectLocationParam param,
  }) async {
    BaseResponse response = await apiConsumer.post(
      ApiConstants.checkTechZone,
      body: param.toJson(),
    );
    if (response.status == true) {
      return ZoneLocationModel(
        isAllowTechInZone: response.data,
        message: response.message,
      );
    } else {
      throw ServerException(response.message.toString());
    }
  }

  @override
  Future<String> updateLocation({
    required UpdateLocationParam param,
    required String token,
  }) async {
    Map<String, dynamic> body = {
      'lat': param.lat,
      'long': param.long,
    };
    
    if (param.address != null && param.address!.isNotEmpty) {
      body['address'] = param.address;
    }
    
    if (param.avatar != null) {
      body['avatar'] = MultipartFile.fromFileSync(param.avatar!.path);
    }
    
    BaseResponse response = await apiConsumer.post(
      ApiConstants.updateLocation,
      body: body,
      formDataIsEnabled: param.avatar != null,
      token: token,
    );
    
    if (response.status == true) {
      return response.message.toString();
    } else {
      throw ServerException(response.message.toString());
    }
  }
}
