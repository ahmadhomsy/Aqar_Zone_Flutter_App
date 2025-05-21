import 'package:aqar_zone_flutter_app/features/auth/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    super.token,
    required super.name,
    required super.email,
    required super.phoneNumber,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      token: json["token"],
      name: json["name"],
      email: json["email"],
      phoneNumber: json["phone"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "token": token,
      "name": name,
      "email": email,
      "phoneNumber": phoneNumber,
    };
  }
}
