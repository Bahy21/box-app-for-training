import '../login.dart';

abstract class AuthRemoteDataSource{

  Future<String> loginAndResendCode({required LoginParameter param});

  }

