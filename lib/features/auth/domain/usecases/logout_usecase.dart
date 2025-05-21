import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../repositories/auth_repositories.dart';

class LogoutUseCase {
  final AuthRepositories repositories;

  LogoutUseCase(this.repositories);
  Future<Either<Failure, Unit>> call(String token) async {
    return await repositories.Logout(token);
  }
}
