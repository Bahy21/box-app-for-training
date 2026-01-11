import 'package:box_app/api_constants/auth_repository/auth_repository.dart';
import 'package:box_app/api_constants/login.dart';
import 'package:box_app/core/framework/app_firebase.dart';
import 'package:box_app/core/framework/device_info.dart';
import 'package:box_app/core/helpers/custom_phone_controller.dart';
import 'package:box_app/core/util/extensions/navigation.dart';
import 'package:box_app/core/util/routing/routes.dart';
import 'package:box_app/core/widgets/custom_toast.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

import '../../../../api_verify_code/date/pin_code_argument.dart';


part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final AuthRepository repository;
  final AppFirebase appFirebase;
  final DeviceInfo deviceInfo;


  LoginCubit(this.repository, this.appFirebase, this.deviceInfo)
      : super(LoginInitial());

  PhoneFieldController phoneCtrl = PhoneFieldController();
  String? fcmToken;

  Future<void> getToken() async {
    try {
      fcmToken = await appFirebase.getFirebaseToken();
    } catch (error) {
      showToast(text: error.toString(), state: ToastStates.error);
      emit(LoginFailure());
    }
  }

  void login({required BuildContext context}) async {
    emit(LoginUserLoading());
    // await getToken();
      var result = await repository.loginAndResendCode(
        param: LoginParameter(
          phone: phoneCtrl.controller.text,
          fcmToken: fcmToken??"fire",
        ),
      );

      result.fold(
            (failure) {
          showToast(text: failure.message, state: ToastStates.error);
          emit(LoginFailure());
        },
            (message) {
          emit(LoginSuccess());
          context.pushWithNamed(
            Routes.pinCodeView,
            arguments: PinCodeArgument(
              isUser: true,
              phone: phoneCtrl.controller.text,
              deviceId: deviceInfo.id,
              tokenFirebase: fcmToken??"",
            ),
          );
        },
      );

  }

  @override
  Future<void> close() {
    phoneCtrl.dispose();
    return super.close();
  }
}
