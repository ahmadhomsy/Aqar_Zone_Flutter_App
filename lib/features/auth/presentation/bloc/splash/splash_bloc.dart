import 'package:aqar_zone_flutter_app/features/auth/domain/usecases/get_token_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/static/static.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final GetTokenUseCase getTokenUseCase;
  final SharedPreferences sharedPreferences;

  SplashBloc({
    required this.sharedPreferences,
    required this.getTokenUseCase,
  }) : super(SplashInitial()) {
    on<SplashEvent>((event, emit) async {
      if (event is GetStatusUserEvent) {
        final failureOrToken = await getTokenUseCase.call();
        failureOrToken.fold((failure) {
          if (sharedPreferences.getBool(isFirstOpenKey) != null) {
            emit(NotSignState());
          } else {
            emit(FirstOpenState());
          }
        }, (token) async {
          emit(SignState());
        });
      }
    });
  }
}
