part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserLoaded extends UserState {
  final UserModel? user;
  final String? token;

  UserLoaded({this.user, this.token});
}

class UserError extends UserState {
  final String error;

  UserError({required this.error});
}

