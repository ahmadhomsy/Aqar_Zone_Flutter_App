import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../data/models/sign_in_request_model.dart';
import '../repositories/auth_repositories.dart';

class SignInUseCase {
  final AuthRepositories repositories;

  SignInUseCase(this.repositories);
  Future<Either<Failure, Unit>> call(SignInRequestModel request) async {
    return await repositories.SignIn(request);
  }
}
