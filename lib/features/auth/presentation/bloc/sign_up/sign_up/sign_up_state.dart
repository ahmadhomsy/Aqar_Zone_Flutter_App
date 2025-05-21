part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class SignUpInitial extends SignUpState {}

class LoadingSignUpState extends SignUpState {}

class SuccessSignUpState extends SignUpState {}

class ErrorSignUpState extends SignUpState {
  final String message;
  ErrorSignUpState({required this.message});
  @override
  List<Object?> get props => [message];
}
