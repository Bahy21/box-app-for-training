import 'dart:io';

class UpdateLocationParam {
  final double lat;
  final double long;
  final String? address;
  final File? avatar;

  UpdateLocationParam({
    required this.lat,
    required this.long,
    this.address,
    this.avatar,
  });
}

