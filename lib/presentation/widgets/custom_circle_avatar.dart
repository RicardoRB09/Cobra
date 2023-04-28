import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    this.enableImageEdit,
    this.diameter,
    super.key,
  });

  final bool? enableImageEdit;
  final double? diameter;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: diameter ?? 0.4.sw,
            height: diameter ?? 0.4.sw,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 2,
                )
              ],
            ),
            child: Image.network(
              'https://cdn.pixabay.com/photo/2017/09/07/16/39/vehicle-2725880_960_720.png',
              // fit: BoxFit.fill,
              width: 50,
              height: 50,
              // scale: 0.1,
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
      ),
    );
  }
}
