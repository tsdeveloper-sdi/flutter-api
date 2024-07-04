import 'package:flutter/material.dart';
import 'pages/dashboard_page.dart';
import 'package:get/get.dart';
import 'pages/login_page.dart';
import 'pages/role_page.dart';
import 'pages/index/adt_page.dart';
import 'pages/forms/adt_page.dart';
import 'pages/forms/dozzer_page.dart';
import 'pages/inspection_menu_page.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: 'Login App',
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      getPages: [
        GetPage(name: '/', page: () => LoginPage()),
        GetPage(name: '/role', page: () => RolePage()),
        GetPage(name: '/dashboard', page: () => DashboardPage()),
        GetPage(name: '/inspection_menu_page', page: () => InspectionMenuPage()),
        GetPage(name: '/adt_index_page', page: () => ADTPage()),
        // GetPage(name: '/dozzer_index_page', page: () => DozzerPage()),
        GetPage(name: '/adt_form_page', page: () => FormADTPage()),
        GetPage(name: '/dozzer_form_page', page: () => FormDozzerPage()),
      ],
    ),
  );
}


// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: (){},
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
