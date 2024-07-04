import 'dart:convert';
import 'data_controller.dart';
import 'package:http/http.dart' as http;
import 'auth_manager.dart';
import 'package:get/get.dart';

class ApiClient {
  final AuthManager _authManager = Get.find<AuthManager>();
  final DataController _dataController = Get.put(DataController());

  Future<http.Response> postLogin(String url) async {
    final headers = {
      'Content-Type': 'application/json',
    };

    final body = jsonEncode({
      'userName': _dataController.usernameController.text,
      'password': _dataController.passwordController.text,
    });
    return http.post(Uri.parse(url), headers: headers, body: body);
  }

  Future<http.Response> post(String url, Object body) async {
    final token = _authManager.token;
    if (token != '') {
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
      return http.post(Uri.parse(url), headers: headers, body: body);
    } else {
      throw Exception('No token available');
    }
  }

  Future<http.Response> get(String url) async {
    final token = _authManager.token;
    if (token != '') {
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
      return http.get(Uri.parse(url), headers: headers);
    } else {
      throw Exception('No token available');
    }
  }

  Future<http.Response> put(String url, String body) async {
    final token = _authManager.token;
    if (token != '') {
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
      return http.put(Uri.parse(url), headers: headers, body: body);
    } else {
      throw Exception('No token available');
    }
  }
}
