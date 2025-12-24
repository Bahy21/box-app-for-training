import 'package:bloc/bloc.dart';
import 'package:boxapp/home/api_login/my _repo.dart';
import 'package:meta/meta.dart';

import '../user.dart';

part 'my_state.dart';

class MyCubit extends Cubit<MyState> {
  final MyRepo myRepo;
  
  MyCubit(this.myRepo) : super(MyInitial());

  Future<void> createUser({
    required String phone,
    required String password,
    String? fcmToken,
    String? token,
  }) async {
    emit(CreateUserLoading());
    
    try {
      final user = await myRepo.createNewUser(
        phone: phone,
        password: password,
        fcmToken: fcmToken,
        token: token,
      );
      emit(CreateUserSuccess(user: user));
    } catch (e) {
      emit(CreateUserError(
        message: e.toString().replaceAll('Exception: ', ''),
      ));
    }
  }
}
