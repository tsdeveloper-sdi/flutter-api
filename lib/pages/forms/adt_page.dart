import 'package:flutter/material.dart';
import '../../controller/data_controller.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../controller/side_menu_controller.dart';
import '../../controller/auth_manager.dart';

class FormADTPage extends StatefulWidget {
  @override
  State<FormADTPage> createState() => _FormADTPageState();
}

class _FormADTPageState extends State<FormADTPage> {
  bool isOpened = false;
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  final SideMenuController _sideMenuController = Get.put(SideMenuController());
  final AuthManager _authManager = Get.find<AuthManager>();
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
              "Form ADT",
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 100),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'No Kendaraan',
                      ),
                      controller: _dataController.adtNoUnitController,
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'HM/KM',
                      ),
                      controller: _dataController.adtHmkmController,
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Inspektor',
                      ),
                      controller: _dataController.adtInspectorController,
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Tanggal Inspeksi',
                      ),
                      controller: _dataController.adtDateController,
                      onTap: () async {
                        DateTime? _picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
                        if (_picked != null) {
                          setState(() {
                            _dataController.adtDateController.text =
                                _picked.toString().split(" ")[0];
                          });
                        }
                      },
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Jam Inspeksi',
                      ),
                      controller: _dataController.adtTimeController,
                      onTap: () async {
                        TimeOfDay? _picked = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                          initialEntryMode: TimePickerEntryMode.input,
                          builder: (BuildContext context, Widget? child) {
                            return MediaQuery(
                              data: MediaQuery.of(context).copyWith(
                                alwaysUse24HourFormat: true,
                              ),
                              child: child!,
                            );
                          },
                        );
                        if (_picked != null) {
                          setState(() {
                            _dataController.adtTimeController.text =
                                _picked.toString();
                          });
                        }
                      },
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Lokasi Inspeksi',
                      ),
                      controller: _dataController.adtLocationController,
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Site Project',
                      ),
                      controller: _dataController.adtSiteController,
                    ),
                    SizedBox(height: 10),
                    Divider(),
                    SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: DataTable(
                          columns: const <DataColumn>[
                            DataColumn(label: Text("Kondisi")),
                            DataColumn(label: Text("Komponen")),
                            DataColumn(label: Text("Pastikan Kondisi Berikut"))
                          ],
                          rows: _dataController.adtMainItems.expand((header) {
                            return [
                              DataRow(
                                cells: [
                                  DataCell(Container()),
                                  DataCell(Text(header,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))),
                                  DataCell(Container()),
                                ],
                              ),
                              ..._dataController.adtList
                                  .where((item) => header == item.mainItem)
                                  .map((item) {
                                return DataRow(
                                  cells: [
                                    DataCell(
                                      ToggleSwitch(
                                        minWidth: 90.0,
                                        cornerRadius: 20.0,
                                        activeBgColors: [
                                          [Colors.green[800]!],
                                          [Colors.red[800]!]
                                        ],
                                        activeFgColor: Colors.white,
                                        inactiveBgColor: Colors.grey,
                                        inactiveFgColor: Colors.white,
                                        initialLabelIndex: 1,
                                        totalSwitches: 2,
                                        labels: ['OK', 'NO'],
                                        radiusStyle: true,
                                        onToggle: (index) {
                                          print('switched to: $index');
                                        },
                                      ),
                                    ),
                                    DataCell(Text(item.component)),
                                    DataCell(Text(item.description)),
                                  ],
                                );
                              }).toList(),
                            ];
                          }).toList(),

                          // rows: _dataController.mainItemADT
                          //     .map((item) => DataRow(
                          //           cells: <DataCell>[
                          //             DataCell(Container()),
                          //             DataCell(Text(item)),
                          //             DataCell(Container()),
                          //           ],
                          //         ))
                          //     .toList(),
                          // rows: _dataController.listADT.map((item) {
                          //   return DataRow(
                          //     cells: <DataCell>[
                          //       DataCell(
                          //         ToggleSwitch(
                          //           minWidth: 90.0,
                          //           cornerRadius: 20.0,
                          //           activeBgColors: [
                          //             [Colors.green[800]!],
                          //             [Colors.red[800]!]
                          //           ],
                          //           activeFgColor: Colors.white,
                          //           inactiveBgColor: Colors.grey,
                          //           inactiveFgColor: Colors.white,
                          //           initialLabelIndex: 1,
                          //           totalSwitches: 2,
                          //           labels: ['OK', 'NO'],
                          //           radiusStyle: true,
                          //           onToggle: (index) {
                          //             print('switched to: $index');
                          //           },
                          //         ),
                          //       ),
                          //       DataCell(Text(item.component)),
                          //       DataCell(Text(item.description)),
                          //     ],
                          //   );
                          // }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
