// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CobraLogo extends StatelessWidget {
  const CobraLogo({
    this.scale,
    this.height,
    super.key,
  });

  final double? scale;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height ?? 88.h,
      child: Image.asset(
        'assets/images/logo-no-background-AI.png',
        scale: scale ?? 2.5,
      ),
    );
  }
}
