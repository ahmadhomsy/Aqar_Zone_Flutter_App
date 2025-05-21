import 'package:aqar_zone_flutter_app/features/auth/domain/entities/user.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../repositories/auth_repositories.dart';

class GetCachedUserUseCase {
  final AuthRepositories repositories;

  GetCachedUserUseCase(this.repositories);
  Future<Either<Failure, User>> call() async {
    return await repositories.GetCachedUser();
  }
}
