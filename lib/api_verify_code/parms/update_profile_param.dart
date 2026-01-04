import 'dart:io';

class UpdateProfileParam {
  final File? avatar;
  final String? name;
  final String? email;
  final int? cityId;

  UpdateProfileParam({
    this.avatar,
    this.name,
    this.email,
    this.cityId,
  });
}

