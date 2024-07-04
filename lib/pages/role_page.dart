import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../controller/auth_manager.dart';
import '../controller/data_controller.dart';
import '../controller/api_client.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';

class RolePage extends StatefulWidget {
  const RolePage({super.key});

  @override
  State<RolePage> createState() => _RolePageState();
}

class _RolePageState extends State<RolePage> {
  final AuthManager _authManager = Get.put(AuthManager());
  final DataController _dataController = Get.put(DataController());
  final ApiClient _apiClient = ApiClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Form Example'),
      ),
      body: Container(
        color: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.all(300.0),
          child: Column(
            children: [
              CustomDropdown<DataListModel>(
                initialItem: _dataController.roles.first,
                items: _dataController.roles,
                onChanged: (value) async {
                  EasyLoading.show(status: 'Loading...');
                  _dataController.selectedRoleId = value.id.toString();
                  if (_authManager.token != '') {
                    _dataController.org.clear();
                    final responseOrg = await _apiClient.get(
                        'https://erp.astina.id/api/v1/auth/organizations?client=${_dataController.clientId}&role=${_dataController.selectedRoleId}');
                    if (responseOrg.statusCode == 200) {
                      final jsonData = jsonDecode(responseOrg.body);
                      for (int i = 0; i < jsonData['organizations'].length; i++) {
                        _dataController.org.add(
                          DataListModel(jsonData['organizations'][i]['id'],
                              jsonData['organizations'][i]['name']),
                        );
                      }
                    } else {
                      Get.snackbar('Error', '${responseOrg.statusCode}');
                    }
                  } else {
                    Get.snackbar('Error', 'Not Found of Token');
                  }
                  _dataController.selectedRoleId = value.id.toString();
                  _dataController.selectedOrgId =
                      _dataController.org[0].id.toString();
                  EasyLoading.dismiss();
                  setState(() {});
                },
              ),
              CustomDropdown<DataListModel>(
                initialItem: _dataController.org.first,
                items: _dataController.org,
                onChanged: (value) async {
                  setState(() {
                    _dataController.selectedOrgId = value.id.toString();
                  });
                },
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 50,
                width: 300,
                child: ElevatedButton(
                  child: Text('OK'),
                  onPressed: () async {
                    if (_authManager.token != '') {
                      final body = jsonEncode({
                        'clientId': _dataController.clientId,
                        'roleId': _dataController.selectedRoleId,
                        'organizationId': _dataController.selectedOrgId,
                        'language': "en-US",
                      });
                      final response = await _apiClient.put(
                          'https://erp.astina.id/api/v1/auth/tokens', body);
                      if (response.statusCode == 200) {
                        final jsonData = jsonDecode(response.body);
                        if (jsonData['token'] != null) {
                          _authManager.setAuthenticated(true);
                          _authManager.setToken(jsonData['token']);
                          _authManager.saveToken();
                        }
                        Get.toNamed('/dashboard');
                      } else {
                        Get.snackbar('Error', '${response.statusCode}');
                      }
                    } else {
                      Get.snackbar('Error', 'Not Found of Token');
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
