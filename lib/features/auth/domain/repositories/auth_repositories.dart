import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../data/models/sign_in_request_model.dart';
import '../../data/models/sign_up_request_model.dart';
import '../entities/user.dart';

abstract class AuthRepositories {
  Future<Either<Failure, Unit>> SignIn(SignInRequestModel request);
  Future<Either<Failure, Unit>> SignUp(SignUpRequestModel request);
  Future<Either<Failure, Unit>> Logout(String token);
  Future<Either<Failure, String>> GetToken();
  Future<Either<Failure, User>> GetCachedUser();
}
