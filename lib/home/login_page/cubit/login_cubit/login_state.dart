part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginUserLoading extends LoginState {}

class LoginTechLoading extends LoginState {}

class LoginFailure extends LoginState {}

class LoginSuccess extends LoginState {}
