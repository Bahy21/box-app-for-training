part of 'create_acc_user_cubit.dart';

@immutable
abstract class CreateAccUserState {}

class CreateAccUserInitial extends CreateAccUserState {}

class ChangeValueDropDown extends CreateAccUserState {}

class AcceptTermsAndCond extends CreateAccUserState {}

class GetCitiesLoading extends CreateAccUserState {}

class CreateAccLoading extends CreateAccUserState {}

class CreateAccFailure extends CreateAccUserState {}

class ChangeLangFailure extends CreateAccUserState {}

class SaveDataFailure extends CreateAccUserState {}

class GetCitiesSuccess extends CreateAccUserState {}

class GetCitiesFailure extends CreateAccUserState {
  final String error;

  GetCitiesFailure({required this.error});
}

class RegisterSuccess extends CreateAccUserState {
  final String token;
  final UserModel user;

  RegisterSuccess({required this.token, required this.user});
}
