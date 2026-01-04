import 'package:box_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

import '../parms/lang_param.dart';
import '../pin_code_cubit/models/loyalty_points_model.dart';
import '../pin_code_cubit/models/social_media_model.dart';
import '../parms/update_profile_param.dart';
import '../user_model.dart';

abstract class SettingRepository {
  Future<Either<Failure, String>> logOut();

  Future<Either<Failure, String>> deleteAcc();

  Future<Either<Failure, SocialMediaModel>> fetchSocialMedias();
  Future<Either<Failure, UserModel>> fetchUserAuth();

  Future<Either<Failure, String>> toggleNotification();

  Future<Either<Failure, String>> changeLang({
    required LangParam param,
    String? token,
  });

  Future<Either<Failure, UserModel>> updateProfile({
    required UpdateProfileParam param,
    required String token,
  });

  Future<Either<Failure, LoyaltyPointsModel>> getLoyaltyPoints();

  Either<Failure, dynamic> clearDataUser();
}
