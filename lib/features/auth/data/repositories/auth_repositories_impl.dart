import 'package:aqar_zone_flutter_app/core/error/failures.dart';
import 'package:aqar_zone_flutter_app/features/auth/data/data_sources/user_local_data_source.dart';
import 'package:aqar_zone_flutter_app/features/auth/data/data_sources/user_remote_data_source.dart';
import 'package:aqar_zone_flutter_app/features/auth/data/models/sign_up_request_model.dart';
import 'package:aqar_zone_flutter_app/features/auth/domain/entities/user.dart';
import 'package:aqar_zone_flutter_app/features/auth/domain/repositories/auth_repositories.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../models/sign_in_request_model.dart';

class AuthRepositoriesImpl implements AuthRepositories {
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoriesImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, Unit>> Logout(String token) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.logout(token);
        await localDataSource.clearCachedUser();
        return Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> SignIn(SignInRequestModel request) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteUser = await remoteDataSource.signIn(request);
        localDataSource.cacheUser(remoteUser);
        return Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> SignUp(SignUpRequestModel request) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteUser = await remoteDataSource.signUp(request);
        localDataSource.cacheUser(remoteUser);
        return Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, String>> GetToken() async {
    try {
      final token = await localDataSource.getToken();
      return Right(token);
    } on NotSignException {
      return Left(NotSignFailure());
    }
  }

  @override
  Future<Either<Failure, User>> GetCachedUser() async {
    try {
      final localeUser = await localDataSource.getCachedUser();
      return Right(localeUser);
    } on NotSignException {
      return Left(NotSignFailure());
    }
  }
}
