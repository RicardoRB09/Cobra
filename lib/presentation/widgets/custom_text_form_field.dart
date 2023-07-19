// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    this.textEditingController,
    this.textAlign,
    this.keyboardType = TextInputType.text,
    this.obscureText,
    this.errorText,
    this.errorMaxLines,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.contentPadding,
    this.maxLines,
    this.readOnly = false,
    this.enabled,
    this.borderRadius = 50,
    this.onTap,
    this.onChanged,
    this.validator,
    this.customKey,
    super.key,
  });

  final TextEditingController? textEditingController;
  final TextAlign? textAlign;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final String? hintText;
  final String? errorText;
  final int? errorMaxLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLines;
  final bool? readOnly;
  final bool? enabled;
  final int borderRadius;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Key? customKey;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: customKey,
      controller: textEditingController,
      textAlign: textAlign ?? TextAlign.start,
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      maxLines: maxLines,
      readOnly: readOnly!,
      enabled: enabled,
      decoration: InputDecoration(
        hintText: hintText,
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 8.h,
            ),
        errorText: errorText,
        errorMaxLines: errorMaxLines,
        filled: true,
        fillColor: Colors.white,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none),
        ),
        focusedBorder: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(borderRadius.r),
          borderSide: BorderSide(
            color: Colors.green.shade800,
            width: 2,
          ),
        ),
        errorBorder: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(borderRadius.r),
          borderSide: BorderSide(
            color: Colors.red.shade800,
            width: 2,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(borderRadius.r),
          borderSide: BorderSide(
            color: Colors.red.shade800,
            width: 2,
          ),
        ),
      ),
      onTap: onTap,
      onChanged: onChanged,
      validator: validator,
    );
  }
}
