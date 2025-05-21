import 'package:equatable/equatable.dart';

class SignUpRequestModel extends Equatable {
  final String name;
  final String email;
  final String phone;
  final String password;
  final String confirmPassword;

  const SignUpRequestModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.confirmPassword,
  });

  @override
  List<Object> get props => [name, email, phone, password, confirmPassword];

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
      'confirmPassword': confirmPassword,
    };
  }
}
