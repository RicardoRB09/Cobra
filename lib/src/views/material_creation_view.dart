import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';

class MaterialCreation extends StatelessWidget {
  const MaterialCreation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {},
          child: Icon(
            Ionicons.chevron_back_outline,
            color: Colors.green.shade800,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Create Material',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 16.sp,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 0.08.sh),
            width: double.infinity,
            child: Image.asset(
              'assets/images/logo.jpeg',
              scale: 2.5,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: Colors.green.shade200.withOpacity(0.2),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
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
                    TextField(
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
                    InkWell(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.r),
                          gradient: LinearGradient(
                            colors: [
                              Colors.green.shade800,
                              Colors.green.shade500
                            ],
                          ),
                        ),
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.all(20),
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
          )
        ],
      ),
    );
  }
}
