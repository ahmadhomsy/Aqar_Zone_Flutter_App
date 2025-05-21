import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../repositories/auth_repositories.dart';

class GetTokenUseCase {
  final AuthRepositories repositories;

  GetTokenUseCase(this.repositories);
  Future<Either<Failure, String>> call() async {
    return await repositories.GetToken();
  }
}
