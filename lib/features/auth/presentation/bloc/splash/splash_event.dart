part of 'splash_bloc.dart';

@immutable
sealed class SplashEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetStatusUserEvent extends SplashEvent {}
