import 'package:aqar_zone_flutter_app/features/auth/data/models/sign_up_request_model.dart';
import 'package:aqar_zone_flutter_app/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../../../../../../core/error/failures.dart';
import '../../../../../../core/strings/failures.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpUseCase signUpUseCase;
  SignUpBloc({required this.signUpUseCase}) : super(SignUpInitial()) {
    on<SignUpEvent>((event, emit) async {
      if (event is SubmitSignUpEvent) {
        emit(LoadingSignUpState());
        final failureOrUnit = await signUpUseCase.call(event.request);
        failureOrUnit.fold((failure) {
          emit(ErrorSignUpState(message: _mapFailureToMessage(failure)));
        }, (_) => emit(SuccessSignUpState()));
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
