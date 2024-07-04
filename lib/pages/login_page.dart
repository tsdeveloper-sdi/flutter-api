import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'dart:convert';
import '../controller/auth_manager.dart';
import '../controller/data_controller.dart';
import '../controller/api_client.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final AuthManager _authManager = Get.put(AuthManager());
  final DataController _dataController = Get.put(DataController());
  final ApiClient _apiClient = ApiClient();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _dataController.usernameController.text = "SDIAdmin";
    _dataController.passwordController.text = "Sql123*";
    return Scaffold(
      appBar: AppBar(
        title: Text('LoginPage'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(300.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _dataController.usernameController,
                  decoration: InputDecoration(labelText: 'Username'),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _dataController.passwordController,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () async {
                      EasyLoading.show(status: 'Loading...');
                      if (_formKey.currentState?.validate() ?? false) {
                        _formKey.currentState?.save();
                        final response = await _apiClient
                            .postLogin('https://erp.astina.id/api/v1/auth/tokens');
                        print(response);
                        if (response.statusCode == 200) {
                          final jsonData = jsonDecode(response.body);
                          if (jsonData['token'] != null) {
                            _authManager.setAuthenticated(true);
                            _authManager.setToken(jsonData['token']);
                            _authManager.saveToken();
                            _dataController.clientId =
                                jsonData['clients'][0]['id'].toString();
                            _dataController.clientName =
                                jsonData['clients'][0]['name'].toString();
                            //Get Roles
                            if (_authManager.token != '') {
                              _dataController.roles.clear();
                              final responseRoles = await _apiClient.get(
                                  'https://erp.astina.id/api/v1/auth/roles?client=${_dataController.clientId}');
                              if (responseRoles.statusCode == 200) {
                                final jsonData = jsonDecode(responseRoles.body);
                                for (int i = 0; i < jsonData['roles'].length; i++) {
                                  _dataController.roles.add(
                                    DataListModel(
                                      jsonData['roles'][i]['id'],
                                      jsonData['roles'][i]['name'],
                                    ),
                                  );
                                }
                                _dataController.org.clear();
                                final responseOrg = await _apiClient.get(
                                    'https://erp.astina.id/api/v1/auth/organizations?client=${_dataController.clientId}&role=${_dataController.roles.first.id}');
                                if (responseOrg.statusCode == 200) {
                                  final jsonData = jsonDecode(responseOrg.body);
                                  for (int i = 0;
                                      i < jsonData['organizations'].length;
                                      i++) {
                                    _dataController.org.add(
                                      DataListModel(
                                        jsonData['organizations'][i]['id'],
                                        jsonData['organizations'][i]['name'],
                                      ),
                                    );
                                  }
                                } else {
                                  Get.snackbar(
                                      'Error', '${responseRoles.statusCode}');
                                }
                                Get.toNamed('/role');
                              } else {
                                Get.snackbar(
                                    'Error', '${responseRoles.statusCode}');
                              }
                            } else {
                              Get.snackbar('Error', 'Not Found of Token');
                            }
                          } else {
                            Get.snackbar('Error', response.body);
                          }
                        } else if (response.statusCode == 401) {
                          final jsonData = jsonDecode(response.body);
                          if (jsonData['detail'] != null) {
                            Get.snackbar('Error', '${jsonData['detail']}');
                          } else {
                            Get.snackbar('Error', response.body);
                          }
                        } else {
                          Get.snackbar('Error', '${response.statusCode}');
                        }
                      }
                      EasyLoading.dismiss();
                    },
                    child: Text('Login'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
