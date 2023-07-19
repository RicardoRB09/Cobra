// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.text,
    this.onTap,
    this.isLoading = false,
    super.key,
  });

  final String text;
  final void Function()? onTap;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.red,
      enableFeedback: true,
      borderRadius: BorderRadius.circular(50.r),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 16.h),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.r),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 4),
            ),
          ],
          gradient: LinearGradient(
            colors: [
              Colors.green.shade800.withOpacity(0.9),
              Colors.green.shade500.withOpacity(0.9)
            ],
          ),
        ),
        child: isLoading!
            ? LoadingAnimationWidget.staggeredDotsWave(
                color: Colors.white,
                size: 30.sp,
              )
            : Text(
                text,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold),
              ),
      ),
    );
  }
}
