// Flutter imports:
import 'package:cobra/presentation/providers/driver_provider.dart';
import 'package:cobra/presentation/providers/register_provider.dart';
import 'package:cobra/services/driver_service.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:cobra/config/router/app_router.dart';
import 'package:cobra/presentation/providers/login_provider.dart';
import 'package:cobra/services/auth_service.dart';
import 'package:cobra/services/user_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => AuthService(),
            ),
            ChangeNotifierProvider(
              create: (context) => UserService(),
            ),
            ChangeNotifierProvider(
              create: (context) => LoginProvider(),
            ),
            ChangeNotifierProvider(
              create: (context) => RegisterProvider(),
            ),
            ChangeNotifierProvider(
              create: (context) => DriverService(),
            ),
            ChangeNotifierProvider(
              create: (context) => DriverProvider(),
            )
          ],
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: appRouter,
            theme: ThemeData(
              useMaterial3: true,
              colorSchemeSeed: Colors.green.shade800,
              appBarTheme: const AppBarTheme(
                color: Colors.white,
                shadowColor: Colors.black26,
                elevation: 3,
              ),
            ),
          ),
        );
      },
    );
  }
}
