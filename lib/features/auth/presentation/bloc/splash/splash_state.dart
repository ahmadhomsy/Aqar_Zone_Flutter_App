part of 'splash_bloc.dart';

@immutable
sealed class SplashState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class SplashInitial extends SplashState {}

class FirstOpenState extends SplashState {}

class SignState extends SplashState {}

class NotSignState extends SignState {}
