/*
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../my _repo.dart';
import '../user.dart';

part 'my_state.dart';

class MyCubit extends Cubit<MyState> {
  final MyRepo myRepo;

  MyCubit(this.myRepo) : super(MyInitial());

  Future<void> createUser({
    required String phone,
    required String password,
    String token = '',
  }) async {
    emit(CreateUserLoading());
    try {
      final user = await myRepo.createNewUser(
        phone: phone,
        password: password,
        token: token,
      );
      emit(CreateUserSuccess(user: user));
    } catch (e, stackTrace) {
      emit(CreateUserError(message: e.toString()));
      print(stackTrace);
    }
  }
}

 */
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../my _repo.dart';
import '../user.dart';
import 'my_state.dart';

class MyCubit extends Cubit<MyState> {
  final MyRepo myRepo;

  MyCubit(this.myRepo) : super(MyInitial());

  Future<void> createUser({required String phone, required String password}) async {
    emit(CreateUserLoading());

    try {
      final user = await myRepo.createNewUser(
        phone: phone,
        password: password,
      );
      emit(CreateUserSuccess(user: user));
    } catch (e) {
      emit(CreateUserError(message: e.toString()));
    }
  }
}

