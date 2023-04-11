import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    this.keyboardType,
    this.hintText,
    this.prefixIcon,
    this.contentPadding,
    this.maxLines,
    this.borderRadius = 50,
    super.key,
  });

  final TextInputType? keyboardType;
  final String? hintText;
  final Widget? prefixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLines;
  final int borderRadius;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.start,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        isDense: true,
        contentPadding: contentPadding,
        filled: true,
        fillColor: Colors.grey.shade200,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none),
        ),
      ),
    );
  }
}
