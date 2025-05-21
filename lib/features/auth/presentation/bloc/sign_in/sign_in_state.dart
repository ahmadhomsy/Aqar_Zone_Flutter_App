part of 'sign_in_bloc.dart';

@immutable
sealed class SignInState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class SignInInitial extends SignInState {}

class LoadingSignInState extends SignInState {}

class SuccessSignInState extends SignInState {}

class ErrorSignInState extends SignInState {
  final String message;
  ErrorSignInState({required this.message});
  @override
  List<Object?> get props => [message];
}
