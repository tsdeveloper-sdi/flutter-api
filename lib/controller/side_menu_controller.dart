import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'data_controller.dart';

class SideMenuController extends GetxController {
  final DataController _dataController = Get.put(DataController());

  Widget sideMenu() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 22.0,
                ),
                SizedBox(height: 16.0),
                Text(
                  "Hello, ${_dataController.usernameController.text}",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              Get.toNamed('/dashboard');
            },
            leading: const Icon(Icons.dashboard, size: 20.0, color: Colors.white),
            title: const Text("Dashboard"),
            textColor: Colors.white,
            dense: true,
          ),
          ListTile(
            onTap: () {
              Get.toNamed('/inspection_menu_page');
            },
            leading: const Icon(Icons.fact_check_outlined, size: 20.0, color: Colors.white),
            title: const Text("Inspection"),
            textColor: Colors.white,
            dense: true,
          ),
        ],
      ),
    );
  }
}