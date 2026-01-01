import 'package:box_app/core/framework/app_firebase.dart';
import 'package:box_app/core/framework/device_info.dart';
import 'package:box_app/core/helpers/custom_phone_controller.dart';
import 'package:box_app/core/util/extensions/navigation.dart';
import 'package:box_app/core/util/routing/routes.dart';
import 'package:box_app/core/widgets/custom_toast.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

import '../auth_repository/auth_repository.dart';
import '../date/pin_code_argument.dart';
import '../login.dart';

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
    // Validate phone number before calling API
    final isValid  = phoneCtrl.validatePhoneField();
    if (!isValid) {
      // Validation failed - error message is already set in phoneCtrl
      if (phoneCtrl.errorMessage.isNotEmpty) {
        showToast(
          text: phoneCtrl.errorMessage,
          state: ToastStates.error,
        );
      }
      return;
    }

    emit(LoginUserLoading());
    await getToken();
    if (fcmToken != null) {
      var result = await repository.loginAndResendCode(
        param: LoginParameter(
          phone: phoneCtrl.controller.text,
          fcmToken: fcmToken!,
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
              tokenFirebase: fcmToken!,
            ),
          );
        },
      );
    } else {
      emit(LoginFailure());
    }
  }

  @override
  Future<void> close() {
    phoneCtrl.dispose();
    return super.close();
  }
}
