import 'package:equatable/equatable.dart';

class SignInRequestModel extends Equatable {
  final String phone;
  final String password;

  SignInRequestModel({
    required this.phone,
    required this.password,
  });
  @override
  List<Object?> get props => [phone, password];

  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'password': password,
    };
  }
}
