// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    this.enableImageEdit,
    this.diameter,
    this.imageUrl,
    super.key,
  });

  final bool? enableImageEdit;
  final double? diameter;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          width: diameter ?? 0.4.sw,
          height: diameter ?? 0.4.sw,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
              )
            ],
          ),
          child: Image.asset(
            (imageUrl != null && imageUrl!.isNotEmpty)
                ? imageUrl!
                : 'assets/images/no_image_available.png',
            fit: BoxFit.fill,
          ),
        ),
        enableImageEdit ?? false
            ? Positioned(
                top: 0.3.sw,
                left: 0.32.sw,
                child: Container(
                  width: 0.08.sw,
                  height: 0.08.sw,
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    shape: BoxShape.circle,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white,
                        spreadRadius: 2,
                      )
                    ],
                  ),
                  child: Icon(
                    Ionicons.camera,
                    size: 20.sp,
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
