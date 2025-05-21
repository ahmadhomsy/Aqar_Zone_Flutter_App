import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/static/static.dart';
import '../models/user_model.dart';

abstract class UserLocalDataSource {
  Future<Unit> cacheUser(UserModel userModel);
  Future<UserModel> getCachedUser();
  Future<Unit> clearCachedUser();
  Future<String> getToken();
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final SharedPreferences sharedPreferences;
  final FlutterSecureStorage secureStorage;

  UserLocalDataSourceImpl({
    required this.sharedPreferences,
    required this.secureStorage,
  });

  @override
  Future<Unit> cacheUser(UserModel userModel) async {
    await secureStorage.write(key: cachedTokenKey, value: userModel.token);
    final userJson = json.encode(userModel.toJson());
    await sharedPreferences.setString(cachedUserKey, userJson);
    return unit;
  }

  @override
  Future<UserModel> getCachedUser() async {
    final userString = sharedPreferences.getString(cachedUserKey);
    if (userString != null) {
      final userMap = json.decode(userString);
      return UserModel.fromJson(userMap);
    } else {
      throw NotSignException();
    }
  }

  @override
  Future<Unit> clearCachedUser() async {
    await sharedPreferences.remove(cachedUserKey);
    await secureStorage.delete(key: cachedTokenKey);
    return unit;
  }

  @override
  Future<String> getToken() async {
    String? token = await secureStorage.read(key: cachedTokenKey);
    if (token != null) {
      return token;
    } else {
      throw NotSignException();
    }
  }
}
