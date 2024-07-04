import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'dart:convert';
import '../controller/auth_manager.dart';
import '../controller/data_controller.dart';
import '../controller/api_client.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthManager _authManager = Get.put(AuthManager());
  final DataController _dataController = Get.put(DataController());
  final ApiClient _apiClient = ApiClient();
  final _formKey = GlobalKey<FormState>();
  bool isHide = true;

  @override
  Widget build(BuildContext context) {
    _dataController.usernameController.text = "SDIAdmin";
    _dataController.passwordController.text = "Sql123*";
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: height,
        width: width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ResponsiveWidget.isSmallScreen(context)
                ? const SizedBox()
                : Expanded(
                    child: Container(
                      height: height,
                      color: Colors.blueAccent,
                      child: Center(
                        child: Text(
                          'Global Makara Teknik',
                          style: TextStyle(
                            fontSize: 48.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ),
            Expanded(
              child: Container(
                height: height,
                margin: EdgeInsets.symmetric(
                    horizontal: ResponsiveWidget.isSmallScreen(context)
                        ? height * 0.032
                        : height * 0.12),
                // color: Colors.white,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: height * 0.2),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: 'Let’s',
                                style: TextStyle(
                                  fontSize: 25.0,
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.normal,
                                )),
                            TextSpan(
                              text: ' Sign In 👇',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: Colors.blueGrey,
                                fontSize: 25.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      Text(
                        'Hey, Enter your details to get sign in \nto your account.',
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: height * 0.064),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          'Username',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6.0),
                      Container(
                        // height: (height * 0.1),
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: Colors.grey.withOpacity(0.3),
                        ),
                        child: TextFormField(
                          controller: _dataController.usernameController,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF607D8B),
                            fontSize: 20.0,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.person),
                            ),
                            // contentPadding: const EdgeInsets.only(top: 16.0),
                            hintText: 'Username',
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.blueGrey.withOpacity(0.5),
                              fontSize: 20.0,
                            ),
                          ),
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return 'Please enter your username';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: height * 0.014),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          'Password',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6.0),
                      Container(
                        // height: 50.0,
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: Colors.grey.withOpacity(0.3),
                        ),
                        child: TextFormField(
                          controller: _dataController.passwordController,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.blueGrey,
                            fontSize: 24.0,
                          ),
                          obscureText: isHide,
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  if (isHide == false) {
                                    isHide = true;
                                  } else {
                                    isHide = false;
                                  }
                                });
                              },
                              icon: Icon(Icons.remove_red_eye),
                            ),
                            prefixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.lock),
                            ),
                            // contentPadding: const EdgeInsets.only(top: 16.0),
                            hintText: 'Password',
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.blueGrey.withOpacity(0.5),
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.05),
                      InkWell(
                        onTap: () async {
                          EasyLoading.show(status: 'Loading...');
                          if (_formKey.currentState?.validate() ?? false) {
                            _formKey.currentState?.save();
                            final response = await _apiClient.postLogin(
                                'https://erp.astina.id/api/v1/auth/tokens');
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
                                    final jsonData =
                                        jsonDecode(responseRoles.body);
                                    for (int i = 0;
                                        i < jsonData['roles'].length;
                                        i++) {
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
                                      final jsonData =
                                          jsonDecode(responseOrg.body);
                                      for (int i = 0;
                                          i < jsonData['organizations'].length;
                                          i++) {
                                        _dataController.org.add(
                                          DataListModel(
                                            jsonData['organizations'][i]['id'],
                                            jsonData['organizations'][i]
                                                ['name'],
                                          ),
                                        );
                                      }
                                    } else {
                                      Get.snackbar('Error',
                                          '${responseRoles.statusCode}');
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
                        borderRadius: BorderRadius.circular(16.0),
                        child: Ink(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 70.0, vertical: 18.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: Colors.blueAccent,
                          ),
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          EasyLoading.show(status: 'Loading...');
                          if (_formKey.currentState?.validate() ?? false) {
                            _formKey.currentState?.save();
                            final response = await _apiClient.postLogin(
                                'https://erp.astina.id/api/v1/auth/tokens');
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
                                    final jsonData =
                                        jsonDecode(responseRoles.body);
                                    for (int i = 0;
                                        i < jsonData['roles'].length;
                                        i++) {
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
                                      final jsonData =
                                          jsonDecode(responseOrg.body);
                                      for (int i = 0;
                                          i < jsonData['organizations'].length;
                                          i++) {
                                        _dataController.org.add(
                                          DataListModel(
                                            jsonData['organizations'][i]['id'],
                                            jsonData['organizations'][i]
                                                ['name'],
                                          ),
                                        );
                                      }
                                    } else {
                                      Get.snackbar('Error',
                                          '${responseRoles.statusCode}');
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
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResponsiveWidget extends StatelessWidget {
  final Widget largeScreen;
  final Widget? mediumScreen;
  final Widget? smallScreen;

  const ResponsiveWidget({
    Key? key,
    required this.largeScreen,
    this.mediumScreen,
    this.smallScreen,
  }) : super(key: key);

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 600;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 1200;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= 600 &&
        MediaQuery.of(context).size.width <= 1200;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return largeScreen;
        } else if (constraints.maxWidth <= 1200 &&
            constraints.maxWidth >= 600) {
          return mediumScreen ?? largeScreen;
        } else {
          return smallScreen ?? largeScreen;
        }
      },
    );
  }
}
