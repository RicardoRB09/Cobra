import 'package:cobra/presentation/widgets/cobra_logo.dart';
import 'package:cobra/presentation/widgets/flip_animation.dart';
import 'package:cobra/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  static const name = 'splash_screen';

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final colors = Theme.of(context).colorScheme;

    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: checkLoginState(context),
          builder: (context, snapshot) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlipAnimation(
                    front: CobraLogo(
                      height: 120.h,
                      scale: 4,
                    ),
                    back: CobraLogo(
                      height: 120.h,
                      scale: 4,
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Future checkLoginState(BuildContext context) async {
    final authService = Provider.of<AuthService>(context, listen: false);
    final isAuthenticated = await authService.isLoggedIn();

    if (context.mounted) {}

    if (isAuthenticated) {
      //TODO: await authService.getSavedEmail();
      context.pushReplacement('/home/0');
    } else {
      context.pushReplacement('/login-screen');
    }
  }
}
