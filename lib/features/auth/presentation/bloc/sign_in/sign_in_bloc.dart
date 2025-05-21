import 'package:aqar_zone_flutter_app/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/strings/failures.dart';
import '../../../data/models/sign_in_request_model.dart';
part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInUseCase signInUseCase;
  SignInBloc({required this.signInUseCase}) : super(SignInInitial()) {
    on<SignInEvent>((event, emit) async {
      if (event is SubmitSignInEvent) {
        emit(LoadingSignInState());
        final failureOrUnit = await signInUseCase.call(event.request);
        failureOrUnit.fold((failure) {
          emit(ErrorSignInState(message: _mapFailureToMessage(failure)));
        }, (_) => emit(SuccessSignInState()));
      }
    });
  }
  String _mapFailureToMessage(Failure failure) {
    if (failure is ServerFailure) {
      return SERVER_FAILURE_MESSAGE;
    } else if (failure is OfflineFailure) {
      return OFFLINE_FAILURE_MESSAGE;
    } else {
      return UN_EXPECTED_ERROR;
    }
  }
}
