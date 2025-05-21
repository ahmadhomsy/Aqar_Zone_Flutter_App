import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? token;
  final String name;
  final String email;
  final int phoneNumber;

  const User({
    this.token,
    required this.name,
    required this.email,
    required this.phoneNumber,
  });
  @override
  List<Object?> get props => [token, name, email, phoneNumber];
}
