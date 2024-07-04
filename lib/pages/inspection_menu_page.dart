import 'package:flutter/material.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'data_controller.dart';
import '../controller/auth_manager.dart';
import '../controller/side_menu_controller.dart';
import '../../controller/data_controller.dart';


class InspectionMenuPage extends StatefulWidget {
  @override
  State<InspectionMenuPage> createState() => _InspectionMenuPageState();
}

class _InspectionMenuPageState extends State<InspectionMenuPage> {
  bool isOpened = false;
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  final AuthManager _authManager = Get.find<AuthManager>();
  final SideMenuController _sideMenuController = Get.put(SideMenuController());
  final DataController _dataController = Get.put(DataController());


  @override
  Widget build(BuildContext context) {
    if (!_authManager.authenticated) {
      Get.toNamed('/');
    }

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
            backgroundColor: Color.fromRGBO(34, 37, 51, 1),
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {
                final _state = _sideMenuKey.currentState!;
                if (_state.isOpened) {
                  _state.closeSideMenu();
                } else {
                  _state.openSideMenu();
                }
              },
            ),
            title: Text(
              "Inspection Menu",
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: Container(
            color: Color.fromRGBO(34, 37, 51, 0.9),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  child: GridView.count(
                    childAspectRatio: 1.5,
                    padding: EdgeInsets.all(30),
                    crossAxisCount: 3,
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 30,
                    children: _dataController.adtHeaderList.map((data) {
                      return InkWell(
                        onTap: () {
                          Get.toNamed(data.route);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(data.img, width: 200),
                              // SizedBox(height: 14),
                              Text(
                                data.title,
                                style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                    // color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
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
