// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';

// Project imports:
import '../../widgets/widgets.dart';

class VehicleCreation extends StatelessWidget {
  static const name = 'vehicle-creation';

  const VehicleCreation({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> vehicleTypes = [
      'Material 1',
      'Material 2',
      'Material 3',
      'Material 4',
    ];

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            context.pop();
          },
          child: Icon(
            Ionicons.chevron_back_outline,
            color: Colors.green.shade800,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Create Vehicle',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 16.sp,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
                enableFeedback: true, foregroundColor: Colors.grey),
            child: Text(
              'Done',
              style: TextStyle(color: Colors.green.shade800),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomCircleAvatar(
                    enableImageEdit: true,
                  ),
                  SizedBox(height: 20.h),
                  _FieldName(
                    name: 'Name',
                    padding: EdgeInsets.only(bottom: 8.h),
                  ),
                  // CustomTextFormField(
                  //   keyboardType: TextInputType.text,
                  //   hintText: 'Enter Vehicle name',
                  //   contentPadding:
                  //       EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                  //   maxLines: 1,
                  //   borderRadius: 15,
                  // ),
                  SizedBox(height: 20.h),
                  _FieldName(
                    name: 'Capacity',
                    padding: EdgeInsets.only(bottom: 8.h),
                  ),
                  // CustomTextFormField(
                  //   keyboardType: const TextInputType.numberWithOptions(
                  //       decimal: true, signed: true),
                  //   hintText: 'Enter Vehicle capacity',
                  //   contentPadding:
                  //       EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                  //   maxLines: 1,
                  //   borderRadius: 15,
                  // ),
                  SizedBox(height: 20.h),
                  _FieldName(
                    name: 'Driver Name',
                    padding: EdgeInsets.only(bottom: 8.h),
                  ),
                  // CustomTextFormField(
                  //   keyboardType: TextInputType.text,
                  //   hintText: 'Enter Driver name',
                  //   contentPadding:
                  //       EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                  //   maxLines: 1,
                  //   borderRadius: 15,
                  // ),
                  SizedBox(height: 20.h),
                  const _FieldName(name: 'Vehicle Type'),
                  CustomDropdownButton(
                    items: vehicleTypes,
                    hint: 'Select the Vehicle type',
                  ),
                  SizedBox(height: 20.h),
                  _FieldName(
                    name: 'Description',
                    padding: EdgeInsets.only(bottom: 8.h),
                  ),
                  // CustomTextFormField(
                  //   keyboardType: TextInputType.text,
                  //   hintText: 'Enter description here',
                  //   contentPadding:
                  //       EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                  //   maxLines: 4,
                  //   borderRadius: 15,
                  // ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FieldName extends StatelessWidget {
  const _FieldName({
    required this.name,
    this.padding,
  });

  final String name;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(0),
      child: Text(
        name,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: Colors.green.shade900,
        ),
      ),
    );
  }
}
