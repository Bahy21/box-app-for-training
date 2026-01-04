
import '../parms/lang_param.dart';
import '../parms/update_profile_param.dart';
import '../pin_code_cubit/models/loyalty_points_model.dart';
import '../pin_code_cubit/models/social_media_model.dart';
import '../user_model.dart';

abstract class SettingRemoteDataSource {
  Future<String> logOut();

  Future<String> deleteAcc();

  Future<String> toggleNotification();

  Future<String> changeLang({required LangParam param, String? token});

  Future<SocialMediaModel> fetchSocialMedias();

  Future<UserModel> authUser();
  
  Future<UserModel> updateProfile({
    required UpdateProfileParam param,
    required String token,
  });

  Future<LoyaltyPointsModel> getLoyaltyPoints();
}
