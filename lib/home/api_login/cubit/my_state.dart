import 'package:meta/meta.dart';
import '../user.dart';

@immutable
abstract class MyState {}

class MyInitial extends MyState {}

class CreateUserLoading extends MyState {}

class CreateUserSuccess extends MyState {
  final User user;
  CreateUserSuccess({required this.user});
}

class CreateUserError extends MyState {
  final String message;
  CreateUserError({required this.message});
}
