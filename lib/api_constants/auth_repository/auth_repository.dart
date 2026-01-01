import 'package:dartz/dartz.dart';

import '../../core/errors/failures.dart';
import '../login.dart';
abstract class AuthRepository {
  Future<Either<Failure, String>> loginAndResendCode({
    required LoginParameter param,
  });


}
