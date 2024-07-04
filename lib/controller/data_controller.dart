import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';

class DataListModel with CustomDropdownListFilter {
  final int id;
  final String name;

  const DataListModel(this.id, this.name);

  @override
  String toString() {
    return name;
  }

  @override
  bool filter(String query) {
    return name.toLowerCase().contains(query.toLowerCase());
  }
}

class headerItems {
  final String title;
  final String img;
  final String route;

  headerItems({
    required this.title,
    required this.img,
    required this.route,
  });
}

class Items {
  final String mainItem;
  final String component;
  final String description;

  Items({
    required this.mainItem,
    required this.component,
    required this.description,
  });
}

//ADT
final List<headerItems> adtHeaderItemsList = [
    headerItems(title: "Articulated Truck", img: "assets/images/adt.png", route: "/adt_index_page"),
    headerItems(title: "Dozer", img: "assets/images/dozer.png", route: "/dozzer_page"),
    headerItems(title: "Dump Truck", img: "assets/images/dt.png", route: "/dt_page"),
    headerItems(title: "Excavator", img: "assets/images/excavator.png", route: "/excavator_page"),
    headerItems(title: "Grader", img: "assets/images/grader.png", route: "/grader_page"),
    headerItems(title: "High Dump Truck", img: "assets/images/hdt.png", route: "/hdt_page"),
];

final List<Items> adtItemsList = [
  Items(mainItem: "Dump Vessel", component: "Vessel plate", description: "Periksa plat bengkok, retak dan lubang"),
  Items(mainItem: "Dump Vessel", component: "Tail gate", description: "Periksa plat bengkok, retak dan lubang"),
  Items(mainItem: "Dump Vessel", component: "Tail gate hinge", description: "Periksa pin/bushing dan grease"),
  Items(mainItem: "Dump Vessel", component: "Dump hinge pin & bushing", description: "Periksa pin/bushing dan grease"),
  Items(mainItem: "Dump Vessel", component: "Dump Cyl pin/bushing", description: "Periksa pin/bushing dan grease"),
  Items(mainItem: "Hidrolik Dump", component: "Pompa hidrolik", description: "Periksa mounting, kebocoran & noise"),
  Items(mainItem: "Hidrolik Dump", component: "Hose Pompa Hidrolik (All)", description: "Periksa kebocoran dan kekakuan"),
  Items(mainItem: "Hidrolik Dump", component: "Control Valve", description: "Periksa mounting, kebocoran & noise"),
  Items(mainItem: "Hidrolik Dump", component: "Hose Control Valve (All)", description: "Periksa kebocoran dan kekakuan"),
  Items(mainItem: "Hidrolik Dump", component: "Hose Tangki Hidrolik", description: "Periksa kebocoran dan kekakuan"),
  Items(mainItem: "Hidrolik Dump", component: "Dump Control Lever (Cabin)", description: "Periksa handle, pin dan link rod"),
  Items(mainItem: "Hidrolik Dump", component: "Dump Control Lever (Body)", description: "Periksa handle, pin dan link rod"),
  Items(mainItem: "Hidrolik Dump", component: "Link Rod", description: "Periksa link pada chassis"),
  Items(mainItem: "Cylinder & Hose", component: "Dump Cylinder", description: "Periksa kebocoran"),
  Items(mainItem: "Cylinder & Hose", component: "Hose Dump Cylinder", description: "Periksa kebocoran dan kekakuan"),
  Items(mainItem: "Frame/Chassis", component: "Chassis Frame", description: "Periksa retak, bengkok & kondisi baut"),
  Items(mainItem: "Frame/Chassis", component: "Aritculated Pin/Bushing", description: "Periksa pin/bushing dan grease"),
  Items(mainItem: "Frame/Chassis", component: "Dump Tension Link", description: "Periksa retak & bengkok"),
  Items(mainItem: "Frame/Chassis", component: "Dump Lift Arm", description: "Periksa retak & bengkok"),
  Items(mainItem: "Frame/Chassis", component: "Pin & Bushing Link Dumping", description: "Periksa pin/bushing dan grease"),
  Items(mainItem: "Frame/Chassis", component: "Spring RH", description: "Periksa plat, pin & bolt/nut"),
  Items(mainItem: "Frame/Chassis", component: "Spring LH", description: "Periksa plat, pin & bolt/nut"),
  Items(mainItem: "Engine", component: "Belt", description: "Periksa kondisi belt dan kekencangan"),
  Items(mainItem: "Engine", component: "Hose/Tube", description: "Periksa kebocoran dan kekakuan"),
  Items(mainItem: "Engine", component: "Radiator Core", description: "Periksa kebersihan dan kebocoran"),
  Items(mainItem: "Engine", component: "Radiator Hose", description: "Periksa kebocoran dan kekakuan"),
  Items(mainItem: "Engine", component: "Turbocharge", description: "Periksa retak dan kebocoran oli"),
  Items(mainItem: "Engine", component: "Air Filter", description: "Periksa kebocoran dan bersihkan jika buntu"),
  Items(mainItem: "Engine", component: "Engine Mounting", description: "Periksa bolt/nut dan karet peredam"),
  Items(mainItem: "Engine", component: "Fuel Hose", description: "Periksa retak dan kebocoran oli"),
  Items(mainItem: "Engine", component: "Engine Start", description: "Periksa kemudahan start"),
  Items(mainItem: "Engine", component: "Engine Noise", description: "Periksa suara engine idle dan stall"),
  Items(mainItem: "Engine", component: "Exhaust", description: "Periksa warna asap exhaust"),
  Items(mainItem: "Engine", component: "Emergency Shutdown", description: "Periksa fungsi"),
  Items(mainItem: "Transmisi dan Hub Wheel", component: "Transmisi", description: "Periksa kebocoran oli"),
  Items(mainItem: "Transmisi dan Hub Wheel", component: "Clutch", description: "Periksa sistem operasi"),
  Items(mainItem: "Transmisi dan Hub Wheel", component: "Drive Shaft", description: "Periksa shaft dan mounting"),
  Items(mainItem: "Transmisi dan Hub Wheel", component: "Differential", description: "Periksa kebocoran oli"),
  Items(mainItem: "Transmisi dan Hub Wheel", component: "Axle Depan", description: "Periksa axle dan support"),
  Items(mainItem: "Transmisi dan Hub Wheel", component: "Axle Belakang", description: "Periksa axle dan support"),
  Items(mainItem: "Steering", component: "Roda/Tuas Kemudi", description: "Periksa fungsi"),
  Items(mainItem: "Steering", component: "Tie Rod", description: "Periksa bengkok, patah"),
  Items(mainItem: "Steering", component: "Wheel Arm", description: "Periksa bengkok, patah dan bolt/nut"),
  Items(mainItem: "Brake", component: "Compressor", description: "Periksa tekanan angin compressor"),
  Items(mainItem: "Brake", component: "Hose Compressor", description: "Periksa kebocoran dan kekakuan"),
  Items(mainItem: "Brake", component: "Air Tank", description: "Periksa kebocoran tangki dan press gauge"),
  Items(mainItem: "Brake", component: "Service Brake", description: "Periksa fungsi service brake"),
  Items(mainItem: "Brake", component: "Parking Brake", description: "Periksa fungsi parking brake"),
  Items(mainItem: "Brake", component: "Brake Pad and Brake Drum", description: "Periksa pad pada masing-masing roda"),
  Items(mainItem: "Kabin", component: "Pintu & Jendela", description: "Periksa handle, plat dan engsel"),
  Items(mainItem: "Kabin", component: "Steering/Handle", description: "Periksa fungsi"),
  Items(mainItem: "Kabin", component: "Instrument/Gauge", description: "Periksa fungsi"),
  Items(mainItem: "Kabin", component: "Hour Meter/Kilometer", description: "Periksa fungsi"),
  Items(mainItem: "Kabin", component: "Wiper", description: "Periksa fungsi"),
  Items(mainItem: "Kabin", component: "Horn", description: "Periksa kekerasan suara"),
  Items(mainItem: "Kabin", component: "Side Mirror", description: "Periksa kaca dan adjuster"),
  Items(mainItem: "Kabin", component: "Seat Belt", description: "Periksa kanvas dan kuncian"),
  Items(mainItem: "Kabin", component: "Air Conditioner", description: "Periksa switch dan temperatur"),
  Items(mainItem: "Electrical", component: "Wiring/Cable", description: "Periksa kabel engine, kabel cabin & fuse"),
  Items(mainItem: "Electrical", component: "Head Lamp", description: "Periksa fungsi"),
  Items(mainItem: "Electrical", component: "Work Lamp", description: "Periksa fungsi"),
  Items(mainItem: "Electrical", component: "Rear Lamp", description: "Periksa fungsi"),
  Items(mainItem: "Electrical", component: "Turn Lamp", description: "Periksa fungsi"),
  Items(mainItem: "Electrical", component: "Lampu Rotary", description: "Periksa fungsi"),
  Items(mainItem: "Electrical", component: "Batterai", description: "Periksa air batterai"),
  Items(mainItem: "Electrical", component: "Batterai Switch", description: "Periksa fungsi"),
  Items(mainItem: "Fuel / Oil / Lube", component: "Fuel Level", description: "Periksa level dan kondisi bahan bakar"),
  Items(mainItem: "Fuel / Oil / Lube", component: "Hydraulic Oil Level", description: "Periksa level dan kondisi oli"),
  Items(mainItem: "Fuel / Oil / Lube", component: "Engine Oil Level", description: "Periksa level dan kondisi oli"),
];

//DOZZER
final List<headerItems> dozzerHeaderItemsList = [
  headerItems(title: "Articulated Truck", img: "assets/images/adt.png", route: "/adt_page"),
  headerItems(title: "Dozer", img: "assets/images/dozer.png", route: "/dozer_page"),
  headerItems(title: "Dump Truck", img: "assets/images/dt.png", route: "/dt_page"),
  headerItems(title: "Excavator", img: "assets/images/excavator.png", route: "/excavator_page"),
  headerItems(title: "Grader", img: "assets/images/grader.png", route: "/grader_page"),
  headerItems(title: "High Dump Truck", img: "assets/images/hdt.png", route: "/hdt_page"),
];

final List<Items> dozzerItemsList = [
  Items(mainItem: "Dump Vessel", component: "Vessel plate", description: "Periksa plat bengkok, retak dan lubang"),
  Items(mainItem: "Dump Vessel", component: "Tail gate", description: "Periksa plat bengkok, retak dan lubang"),
  Items(mainItem: "Dump Vessel", component: "Tail gate hinge", description: "Periksa pin/bushing dan grease"),
  Items(mainItem: "Dump Vessel", component: "Dump hinge pin & bushing", description: "Periksa pin/bushing dan grease"),
  Items(mainItem: "Dump Vessel", component: "Dump Cyl pin/bushing", description: "Periksa pin/bushing dan grease"),
  Items(mainItem: "Hidrolik Dump", component: "Pompa hidrolik", description: "Periksa mounting, kebocoran & noise"),
  Items(mainItem: "Hidrolik Dump", component: "Hose Pompa Hidrolik (All)", description: "Periksa kebocoran dan kekakuan"),
  Items(mainItem: "Hidrolik Dump", component: "Control Valve", description: "Periksa mounting, kebocoran & noise"),
  Items(mainItem: "Hidrolik Dump", component: "Hose Control Valve (All)", description: "Periksa kebocoran dan kekakuan"),
  Items(mainItem: "Hidrolik Dump", component: "Hose Tangki Hidrolik", description: "Periksa kebocoran dan kekakuan"),
  Items(mainItem: "Hidrolik Dump", component: "Dump Control Lever (Cabin)", description: "Periksa handle, pin dan link rod"),
  Items(mainItem: "Hidrolik Dump", component: "Dump Control Lever (Body)", description: "Periksa handle, pin dan link rod"),
  Items(mainItem: "Hidrolik Dump", component: "Link Rod", description: "Periksa link pada chassis"),
  Items(mainItem: "Cylinder & Hose", component: "Dump Cylinder", description: "Periksa kebocoran"),
  Items(mainItem: "Cylinder & Hose", component: "Hose Dump Cylinder", description: "Periksa kebocoran dan kekakuan"),
  Items(mainItem: "Frame/Chassis", component: "Chassis Frame", description: "Periksa retak, bengkok & kondisi baut"),
  Items(mainItem: "Frame/Chassis", component: "Aritculated Pin/Bushing", description: "Periksa pin/bushing dan grease"),
  Items(mainItem: "Frame/Chassis", component: "Dump Tension Link", description: "Periksa retak & bengkok"),
  Items(mainItem: "Frame/Chassis", component: "Dump Lift Arm", description: "Periksa retak & bengkok"),
  Items(mainItem: "Frame/Chassis", component: "Pin & Bushing Link Dumping", description: "Periksa pin/bushing dan grease"),
  Items(mainItem: "Frame/Chassis", component: "Spring RH", description: "Periksa plat, pin & bolt/nut"),
  Items(mainItem: "Frame/Chassis", component: "Spring LH", description: "Periksa plat, pin & bolt/nut"),
  Items(mainItem: "Engine", component: "Belt", description: "Periksa kondisi belt dan kekencangan"),
  Items(mainItem: "Engine", component: "Hose/Tube", description: "Periksa kebocoran dan kekakuan"),
  Items(mainItem: "Engine", component: "Radiator Core", description: "Periksa kebersihan dan kebocoran"),
  Items(mainItem: "Engine", component: "Radiator Hose", description: "Periksa kebocoran dan kekakuan"),
  Items(mainItem: "Engine", component: "Turbocharge", description: "Periksa retak dan kebocoran oli"),
  Items(mainItem: "Engine", component: "Air Filter", description: "Periksa kebocoran dan bersihkan jika buntu"),
  Items(mainItem: "Engine", component: "Engine Mounting", description: "Periksa bolt/nut dan karet peredam"),
  Items(mainItem: "Engine", component: "Fuel Hose", description: "Periksa retak dan kebocoran oli"),
  Items(mainItem: "Engine", component: "Engine Start", description: "Periksa kemudahan start"),
  Items(mainItem: "Engine", component: "Engine Noise", description: "Periksa suara engine idle dan stall"),
  Items(mainItem: "Engine", component: "Exhaust", description: "Periksa warna asap exhaust"),
  Items(mainItem: "Engine", component: "Emergency Shutdown", description: "Periksa fungsi"),
  Items(mainItem: "Transmisi dan Hub Wheel", component: "Transmisi", description: "Periksa kebocoran oli"),
  Items(mainItem: "Transmisi dan Hub Wheel", component: "Clutch", description: "Periksa sistem operasi"),
  Items(mainItem: "Transmisi dan Hub Wheel", component: "Drive Shaft", description: "Periksa shaft dan mounting"),
  Items(mainItem: "Transmisi dan Hub Wheel", component: "Differential", description: "Periksa kebocoran oli"),
  Items(mainItem: "Transmisi dan Hub Wheel", component: "Axle Depan", description: "Periksa axle dan support"),
  Items(mainItem: "Transmisi dan Hub Wheel", component: "Axle Belakang", description: "Periksa axle dan support"),
  Items(mainItem: "Steering", component: "Roda/Tuas Kemudi", description: "Periksa fungsi"),
  Items(mainItem: "Steering", component: "Tie Rod", description: "Periksa bengkok, patah"),
  Items(mainItem: "Steering", component: "Wheel Arm", description: "Periksa bengkok, patah dan bolt/nut"),
  Items(mainItem: "Brake", component: "Compressor", description: "Periksa tekanan angin compressor"),
  Items(mainItem: "Brake", component: "Hose Compressor", description: "Periksa kebocoran dan kekakuan"),
  Items(mainItem: "Brake", component: "Air Tank", description: "Periksa kebocoran tangki dan press gauge"),
  Items(mainItem: "Brake", component: "Service Brake", description: "Periksa fungsi service brake"),
  Items(mainItem: "Brake", component: "Parking Brake", description: "Periksa fungsi parking brake"),
  Items(mainItem: "Brake", component: "Brake Pad and Brake Drum", description: "Periksa pad pada masing-masing roda"),
  Items(mainItem: "Kabin", component: "Pintu & Jendela", description: "Periksa handle, plat dan engsel"),
  Items(mainItem: "Kabin", component: "Steering/Handle", description: "Periksa fungsi"),
  Items(mainItem: "Kabin", component: "Instrument/Gauge", description: "Periksa fungsi"),
  Items(mainItem: "Kabin", component: "Hour Meter/Kilometer", description: "Periksa fungsi"),
  Items(mainItem: "Kabin", component: "Wiper", description: "Periksa fungsi"),
  Items(mainItem: "Kabin", component: "Horn", description: "Periksa kekerasan suara"),
  Items(mainItem: "Kabin", component: "Side Mirror", description: "Periksa kaca dan adjuster"),
  Items(mainItem: "Kabin", component: "Seat Belt", description: "Periksa kanvas dan kuncian"),
  Items(mainItem: "Kabin", component: "Air Conditioner", description: "Periksa switch dan temperatur"),
  Items(mainItem: "Electrical", component: "Wiring/Cable", description: "Periksa kabel engine, kabel cabin & fuse"),
  Items(mainItem: "Electrical", component: "Head Lamp", description: "Periksa fungsi"),
  Items(mainItem: "Electrical", component: "Work Lamp", description: "Periksa fungsi"),
  Items(mainItem: "Electrical", component: "Rear Lamp", description: "Periksa fungsi"),
  Items(mainItem: "Electrical", component: "Turn Lamp", description: "Periksa fungsi"),
  Items(mainItem: "Electrical", component: "Lampu Rotary", description: "Periksa fungsi"),
  Items(mainItem: "Electrical", component: "Batterai", description: "Periksa air batterai"),
  Items(mainItem: "Electrical", component: "Batterai Switch", description: "Periksa fungsi"),
  Items(mainItem: "Fuel / Oil / Lube", component: "Fuel Level", description: "Periksa level dan kondisi bahan bakar"),
  Items(mainItem: "Fuel / Oil / Lube", component: "Hydraulic Oil Level", description: "Periksa level dan kondisi oli"),
  Items(mainItem: "Fuel / Oil / Lube", component: "Engine Oil Level", description: "Periksa level dan kondisi oli"),
];

class DataController extends GetxController {
  // Login
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? clientId;
  String? clientName;
  List<DataListModel> roles = [];
  String? selectedRoleId;
  List<DataListModel> org = [];
  String? selectedOrgId;

  // ADT Form
  TextEditingController adtNoUnitController = TextEditingController();
  TextEditingController adtHmkmController = TextEditingController();
  TextEditingController adtInspectorController = TextEditingController();
  TextEditingController adtDateController = TextEditingController();
  TextEditingController adtTimeController = TextEditingController();
  TextEditingController adtLocationController = TextEditingController();
  TextEditingController adtSiteController = TextEditingController();
  List<headerItems> adtHeaderList= [];
  List<Items> adtList = [];
  final List<String> adtMainItems = [
    "Dump Vessel",
    "Hidrolik Dump",
    "Cylinder & Hose",
    "Frame/Chassis",
    "Engine",
    "Transmisi dan Hub Wheel",
    "Steering",
    "Brake",
    "Kabin",
    "Electrical",
    "Fuel / Oil / Lube",
    "Tire",
  ];

  // Dozzer Form
  TextEditingController dozzerNoUnitController = TextEditingController();
  TextEditingController dozzerHmkmController = TextEditingController();
  TextEditingController dozzerInspectorController = TextEditingController();
  TextEditingController dozzerDateController = TextEditingController();
  TextEditingController dozzerTimeController = TextEditingController();
  TextEditingController dozzerLocationController = TextEditingController();
  TextEditingController dozzerSiteController = TextEditingController();
  List<headerItems> dozzerHeaderList= [];
  List<Items> dozzerList = [];
  final List<String> dozzerMainItems = [
    "Dump Vessel",
    "Hidrolik Dump",
    "Cylinder & Hose",
    "Frame/Chassis",
    "Engine",
    "Transmisi dan Hub Wheel",
    "Steering",
    "Brake",
    "Kabin",
    "Electrical",
    "Fuel / Oil / Lube",
    "Tire",
  ];
  
  DataController() {
    adtHeaderList = adtHeaderItemsList;
    adtList = adtItemsList;
    dozzerHeaderList = dozzerHeaderItemsList;
    dozzerList = dozzerItemsList;
  }
}
