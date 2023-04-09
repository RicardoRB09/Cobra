import 'package:cobra/src/views/login_view.dart';
import 'package:cobra/src/views/material_creation_view.dart';
import 'package:cobra/src/views/pass_recovery_view.dart.dart';
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
          home: const MaterialCreation(),
          theme: ThemeData(
              appBarTheme: const AppBarTheme(
            color: Colors.transparent,
            elevation: 0,
          )),
        );
      },
    );
  }
}
