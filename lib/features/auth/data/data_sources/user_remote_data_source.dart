import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../../../../core/error/exceptions.dart';
import '../models/sign_in_request_model.dart';
import '../models/sign_up_request_model.dart';
import '../models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> signUp(SignUpRequestModel request);
  Future<UserModel> signIn(SignInRequestModel request);
  Future<Unit> logout(String token);
}

class UserRemoteDataSourceImplWithHttp extends UserRemoteDataSource {
  final http.Client client;

  UserRemoteDataSourceImplWithHttp({required this.client});

  @override
  Future<Unit> logout(String token) async {
    var response = await http.get(
      Uri.parse(''),
    );
    if (response.statusCode == 200) {
      return unit;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<UserModel> signIn(SignInRequestModel request) async {
    try {
      var response = await http.get(
        Uri.parse(''),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        return UserModel.fromJson(data);
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<UserModel> signUp(SignUpRequestModel request) async {
    try {
      var response = await http.get(
        Uri.parse(''),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        return UserModel.fromJson(data);
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
