import 'package:box_app/api_verify_code/user_model.dart';
import 'package:box_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

import 'lang_param.dart';

abstract class SettingRepository {
  Future<Either<Failure, String>> logOut();

  Future<Either<Failure, String>> deleteAcc();

  Future<Either<Failure, UserModel>> fetchUserAuth();

  Future<Either<Failure, String>> toggleNotification();
  Future<Either<Failure, String>> changeLang({
    required LangParam param,
    String? token,
  });




  Either<Failure, dynamic> clearDataUser();
}
