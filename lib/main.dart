import 'package:cobra/src/views/User/login_view.dart';
import 'package:cobra/src/views/Material/material_creation_view.dart';
import 'package:cobra/src/views/Material/material_list_view.dart';
import 'package:cobra/src/views/User/pass_recovery_view.dart.dart';
import 'package:cobra/src/views/Vehicle/vehicle_creation_view.dart';
import 'package:cobra/src/views/Vehicle/vehicle_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // designSize: const Size(1440, 2560),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const VehicleListView(),
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              color: Colors.white,
              shadowColor: Colors.black26,
              elevation: 3,
            ),
          ),
        );
      },
    );
  }
}
