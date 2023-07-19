// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';

class PasswordRecovery extends StatelessWidget {
  const PasswordRecovery({super.key});

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
          'Password Recovery',
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
            height: 0.15.sh,
            decoration: BoxDecoration(
                color: Colors.green.shade300.withOpacity(0.3),
                shape: BoxShape.circle),
            child: Center(
              child: Icon(CupertinoIcons.lock_rotation_open,
                  size: 40.sp, color: Colors.white),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 20.w, right: 20.w, bottom: 5.h),
                  child: Text(
                    'Please Enter your associated email. You will receive indications to create a new password.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
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
                    SizedBox(height: 32.h),
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
                          'Send',
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
        ],
      ),
    );
  }
}
