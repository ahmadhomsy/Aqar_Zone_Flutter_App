part of 'sign_in_bloc.dart';

@immutable
sealed class SignInEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SubmitSignInEvent extends SignInEvent {
  final SignInRequestModel request;

  SubmitSignInEvent({required this.request});
}
