part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SubmitSignUpEvent extends SignUpEvent {
  final SignUpRequestModel request;

  SubmitSignUpEvent({required this.request});
}
