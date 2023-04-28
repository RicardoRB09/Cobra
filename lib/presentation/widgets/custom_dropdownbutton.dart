import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropdownButton extends StatelessWidget {
  const CustomDropdownButton({
    super.key,
    required this.items,
    this.hint,
  });

  final List<String> items;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButton(
          // value: 'Select',
          hint: Text(hint ?? ''),
          enableFeedback: true,
          autofocus: true,
          dropdownColor: Colors.grey.shade200,
          isExpanded: true,
          elevation: 6,
          borderRadius: BorderRadius.circular(15.r),
          items: items.map((item) {
            return DropdownMenuItem(
              value: item,
              alignment: Alignment.center,
              child: Text(item),
            );
          }).toList(),
          onChanged: (value) {},
        ),
      ),
    );
  }
}
