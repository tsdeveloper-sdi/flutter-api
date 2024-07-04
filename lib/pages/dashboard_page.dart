import 'package:flutter/material.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:get/get.dart';
import '../controller/database_controller.dart';
import '../controller/side_menu_controller.dart';

class DashboardPage extends StatefulWidget {
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool isOpened = false;
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  final SideMenuController _sideMenuController = Get.put(SideMenuController());
  final DatabaseController _databaseController = Get.put(DatabaseController());

  @override
  Widget build(BuildContext context) {
    return SideMenu(
      background: Color.fromRGBO(34, 37, 51, 1),
      key: _sideMenuKey,
      menu: _sideMenuController.sideMenu(),
      type: SideMenuType.slide,
      onChange: (value) {
        setState(() => isOpened = value);
      },
      child: IgnorePointer(
        ignoring: isOpened,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                final _state = _sideMenuKey.currentState!;
                if (_state.isOpened) {
                  _state.closeSideMenu();
                } else {
                  _state.openSideMenu();
                }
              },
            ),
            title: Text("Dashboard"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              dynamic res = await _databaseController.queryDB(
                  "select * from components", null);
              for (var row in res) {
                // Assuming you know the column names (adjust based on your actual schema)
                print(
                    'Name: ${row['name']}, email: ${row['email']}, age: ${row['age']}');
              }
            },
          ),
        ),
      ),
    );
  }
}
