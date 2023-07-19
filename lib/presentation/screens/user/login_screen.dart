// Flutter imports:

import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:cobra/helpers/show_alerts.dart';
import 'package:cobra/presentation/providers/login_provider.dart';
import 'package:cobra/services/auth_service.dart';
import '../../widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  static const name = 'login-screen';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const CobraLogo(),
                _SignInTitle(),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: Colors.green.shade200.withOpacity(0.2),
                  ),
                  child: _LoginForm(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginPvdr = Provider.of<LoginProvider>(context);
    final authService = Provider.of<AuthService>(context);
    GlobalKey<FormState> loginGlobalKey = GlobalKey<FormState>();

    return Form(
      key: loginGlobalKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomTextFormField(
            keyboardType: TextInputType.emailAddress,
            textEditingController: loginPvdr.emailCtrl,
            hintText: 'Enter your email',
            prefixIcon:
                Icon(Ionicons.mail_outline, color: Colors.green.shade800),
            maxLines: 1,
            enabled: !authService.isAuthenticating,
            onChanged: (value) => loginPvdr.email = value,
            validator: (value) => loginPvdr.emailValidator(value!),
          ),
          SizedBox(height: 16.h),
          CustomTextFormField(
            keyboardType: TextInputType.text,
            textEditingController: loginPvdr.pswdCtrl,
            obscureText: !loginPvdr.obscureText,
            maxLines: 1,
            enabled: !authService.isAuthenticating,
            hintText: 'Enter your password',
            prefixIcon:
                Icon(Ionicons.key_outline, color: Colors.green.shade800),
            suffixIcon: GestureDetector(
              onTap: () {
                loginPvdr.obscureText = !loginPvdr.obscureText;
              },
              child: loginPvdr.obscureText
                  ? const Icon(
                      Ionicons.eye_off_outline,
                      color: Colors.black,
                    )
                  : const Icon(
                      Ionicons.eye_outline,
                      color: Colors.black,
                    ),
            ),
            onChanged: (value) => loginPvdr.password = value,
            validator: (value) => loginPvdr.passWordValidator(value!),
          ),
          SizedBox(height: 16.h),
          InkWell(
            onTap: () {},
            child: const Text('Forgot your Password?'),
          ),
          SizedBox(height: 16.h),
          CustomButton(
            text: 'Login',
            isLoading: authService.isAuthenticating,
            onTap: authService.isAuthenticating
                ? null
                : () async {
                    if (!loginGlobalKey.currentState!.validate()) return;

                    final loginOk = await authService.login(
                      loginPvdr.emailCtrl.text.trim(),
                      loginPvdr.pswdCtrl.text.trim(),
                    );

                    if (context.mounted) {}
                    // FocusScope.of(context).unfocus();

                    if (loginOk) {
                      context.pushReplacement('/home/0');
                    } else {
                      showAlert(
                        context,
                        'Login Failed',
                        'Check your credentials and try again.',
                        'Ok',
                        () => context.pop(),
                      );
                    }
                  },
          ),
          SizedBox(height: 16.h),
          _RegisterOption()
        ],
      ),
    );
  }
}

class _SignInTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 20.w, bottom: 5.h),
        child: Text(
          'Login',
          style: TextStyle(
            fontSize: 25.sp,
            fontWeight: FontWeight.bold,
            color: Colors.green.shade800,
          ),
        ),
      ),
    );
  }
}

class _RegisterOption extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.fromLTRB(20.w, 20.h, 0.w, 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(r"""Don't have an account? """),
            InkWell(
              enableFeedback: true,
              borderRadius: BorderRadius.circular(8),
              onTap: () => context.push('/register-screen'),
              child: Text(
                'Register',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade800,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
