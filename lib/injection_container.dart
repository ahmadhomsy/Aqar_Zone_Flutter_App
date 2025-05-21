import 'package:aqar_zone_flutter_app/features/auth/data/repositories/auth_repositories_impl.dart';
import 'package:aqar_zone_flutter_app/features/auth/domain/repositories/auth_repositories.dart';
import 'package:aqar_zone_flutter_app/features/auth/domain/usecases/get_token_usecase.dart';
import 'package:aqar_zone_flutter_app/features/auth/presentation/bloc/onboarding/on_boarding_cubit.dart';
import 'package:aqar_zone_flutter_app/features/auth/presentation/bloc/sign_up/check_box/check_box_cubit.dart';
import 'package:aqar_zone_flutter_app/features/auth/presentation/bloc/splash/splash_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/network/network_info.dart';
import 'features/auth/data/data_sources/user_local_data_source.dart';
import 'features/auth/data/data_sources/user_remote_data_source.dart';
import 'features/auth/domain/usecases/sign_in_usecase.dart';
import 'features/auth/domain/usecases/sign_up_usecase.dart';
import 'features/auth/presentation/bloc/sign_in/sign_in_bloc.dart';
import 'features/auth/presentation/bloc/sign_up/drop_down_menu/drop_down_menu_cubit.dart';
import 'features/auth/presentation/bloc/sign_up/obscure/obscure_cubit.dart';
import 'features/auth/presentation/bloc/sign_up/sign_up/sign_up_bloc.dart';

final sl = GetIt.instance;
Future<void> init() async {
  //! Features * Auth
  // Bloc

  sl.registerFactory(
      () => SplashBloc(sharedPreferences: sl(), getTokenUseCase: sl()));
  sl.registerFactory(() => OnBoardingCubit(sharedPreferences: sl()));
  sl.registerFactory(() => CheckBoxCubit());
  sl.registerFactory(() => DropDownMenuCubit());
  sl.registerFactory(() => ObscureCubit());
  sl.registerFactory(() => SignUpBloc(signUpUseCase: sl()));
  sl.registerFactory(() => SignInBloc(signInUseCase: sl()));

  // UseCase
  sl.registerLazySingleton(() => GetTokenUseCase(sl()));
  sl.registerLazySingleton(() => SignUpUseCase(sl()));
  sl.registerLazySingleton(() => SignInUseCase(sl()));

  // Repository
  sl.registerLazySingleton<AuthRepositories>(() => AuthRepositoriesImpl(
      remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));
  // DataSources
  sl.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImplWithHttp(client: sl()));
  sl.registerLazySingleton<UserLocalDataSource>(() =>
      UserLocalDataSourceImpl(sharedPreferences: sl(), secureStorage: sl()));
  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton<FlutterSecureStorage>(() => FlutterSecureStorage());
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
