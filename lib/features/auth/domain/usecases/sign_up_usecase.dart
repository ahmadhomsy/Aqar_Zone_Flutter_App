import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../data/models/sign_up_request_model.dart';
import '../entities/user.dart';
import '../repositories/auth_repositories.dart';

class SignUpUseCase {
  final AuthRepositories repositories;

  SignUpUseCase(this.repositories);
  Future<Either<Failure, Unit>> call(SignUpRequestModel request) async {
    return await repositories.SignUp(request);
  }
}
