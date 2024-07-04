import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class AuthManager extends GetxController {
  RxBool _authenticated = RxBool(false);
  RxString _token = RxString('');
  TextEditingController clientId = TextEditingController();

  bool get authenticated => _authenticated.value;

  String get token => _token.value;

  void setAuthenticated(bool value) {
    _authenticated.value = value;
  }

  void setToken(String token) {
    _token.value = token;
  }

  Future<void> saveToken() async {
    final storage = FlutterSecureStorage();
    await storage.write(key: 'token', value: _token.value);
  }

  Future<void> loadToken() async {
    final storage = FlutterSecureStorage();
    final token = await storage.read(key: 'token');
    if (token != null) {
      _token.value = token;
    }
  }
}