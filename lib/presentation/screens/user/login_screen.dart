import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';

import '../../widgets/custom_button.dart';

class LoginScreen extends StatelessWidget {
  static const name = 'login-screen';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 0.02.sh),
                width: double.infinity,
                child: Image.asset(
                  'assets/images/logo-no-background.png',
                  scale: 2.5,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.w, bottom: 5.h),
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade800,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                // padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: Colors.green.shade200.withOpacity(0.2),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextFormField(
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Enter your email',
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 8.h),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(Ionicons.mail_outline,
                            color: Colors.green.shade800),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.r),
                          borderSide: const BorderSide(
                              width: 0, style: BorderStyle.none),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    TextFormField(
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Enter your password',
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 8.h),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(Ionicons.key_outline,
                            color: Colors.green.shade800),
                        suffixIcon: const Icon(
                          Ionicons.eye_outline,
                          color: Colors.black45,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.r),
                          borderSide: const BorderSide(
                              width: 0, style: BorderStyle.none),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    InkWell(
                      onTap: () {},
                      child: const Text('Forgot your Password?'),
                    ),
                    SizedBox(height: 16.h),
                    const CustomButton(
                      text: 'Sign in',
                    ),
                    SizedBox(height: 16.h),
                    const _RegisterOption()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterOption extends StatelessWidget {
  const _RegisterOption({
    super.key,
  });

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
              onTap: () {},
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
