import 'package:box_app/core/util/extensions/navigation.dart';
import 'package:box_app/core/util/routing/routes.dart';
import 'package:box_app/core/widgets/custom_toast.dart';
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

import '../../../../api_constants/auth_repository/auth_repository.dart';
import '../../../../api_verify_code/parms/lang_param.dart';
import '../../../../api_verify_code/pin_code_cubit/models/city_model.dart';
import '../../../../api_verify_code/pin_code_cubit/user_cubit.dart';
import '../../../../api_verify_code/repository/setting_repository.dart';
import '../../../../api_verify_code/user_model.dart';
import '../../../home_page_tap_bar/home_page_tap_bar_import.dart';
import '../params/create_acc_user_param.dart';
import '../repository/create_acc_user_repository.dart';


part 'create_acc_user_state.dart';

@injectable
class CreateAccUserCubit extends Cubit<CreateAccUserState> {
  final CreateAccUserRepository repository;
  final AuthRepository authRepository;
  final SettingRepository settingRepository;
  final TextEditingController cityCtrl = TextEditingController(); // هنا

  final UserCubit userCubit;

  CreateAccUserCubit(
    this.repository,
    this.authRepository,
    this.settingRepository,
    this.userCubit,
  ) : super(CreateAccUserInitial());

  final TextEditingController fullNameCtrl = TextEditingController();
  final TextEditingController registerNameCtr = TextEditingController();
  final TextEditingController registerEmailCtr = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController cityCtr = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final emailFormKey = GlobalKey<FormState>();
  UserModel? userModel;

  String? dropDownVal;

  void changeValue(value) {
    dropDownVal = value;
    emit(ChangeValueDropDown());
  }

  bool isAccepted = false;

  void acceptTerms({required bool value}) {
    isAccepted = value;
    emit(AcceptTermsAndCond());
  }

  List<CityModel> cities = [];

  void fetchCities() async {
    emit(GetCitiesLoading());
    var result = await repository.fetchCities();
    result.fold(
      (failure) {
        emit(GetCitiesFailure(error: failure.message));
      },
      (cities) {
        this.cities = cities;
        emit(GetCitiesSuccess());
      },
    );
  }

  void changeLang({
    required BuildContext context,
    required UserModel user,
    required String token,
    bool navigateToHome = true,
  }) async {
    emit(CreateAccLoading());
    var result = await settingRepository.changeLang(
      param: LangParam(lang: context.locale.languageCode),
      token: token,
    );
    result.fold((failure) {
      showToast(text: failure.message, state: ToastStates.error);
      emit(ChangeLangFailure());
    }, (msg) => saveDataUser(
      context: context,
      token: token,
      user: user,
      navigateToHome: navigateToHome,
    ));
  }

  void createAcc({
    required CreateAccUserParam param,
    required BuildContext context,
    required String token,
  }) async {
    emit(CreateAccLoading());
    var result = await repository.createAcc(param: param, token: token);
    result.fold(
      (failure) {
        showToast(text: failure.message, state: ToastStates.error);
        emit(CreateAccFailure());
      },
      (registerResponse) async {
        userModel = registerResponse.user;

        await userCubit.setUser(
          user: registerResponse.user,
          token: registerResponse.token,
        );

        emit(RegisterSuccess(
          token: registerResponse.token,
          user: registerResponse.user,
        ));
      },
    );
  }

  void saveDataUser({
    required UserModel user,
    required String token,
    required BuildContext context,
    bool navigateToHome = true,
  }) async {
    emit(CreateAccLoading());
    await userCubit.setUser(user: user, token: token);
    var result = authRepository.saveUserData(user: user, token: token);
    result.fold(
      (failure) {
        showToast(text: failure.message, state: ToastStates.error);
        emit(SaveDataFailure());
      },
      (r) {
        if (navigateToHome) {
          context.pushAndRemoveUntilWithNamed(
            Routes.bottomNavView,
            arguments: const Home(),
          );
        }
        emit(GetCitiesSuccess());
      },
    );
  }

  @override
  Future<void> close() {
    fullNameCtrl.dispose();
    emailCtrl.dispose();

    return super.close();
  }
}
