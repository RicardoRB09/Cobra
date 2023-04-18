import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:ionicons/ionicons.dart';

import '../../widgets/custom_dropdownbutton.dart';
import '../../widgets/custom_text_field.dart';

class VehicleCreation extends StatelessWidget {
  const VehicleCreation({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> vehicleTypes = [
      'Material 1',
      'Material 2',
      'Material 3',
      'Material 4',
    ];

    List<String> unitList = [
      'Unit 1',
      'Unit 2',
      'Unit 3',
      'Unit 4',
    ];

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
                  const _VehicleImage(),
                  SizedBox(height: 20.h),
                  _FieldName(
                    name: 'Name',
                    padding: EdgeInsets.only(bottom: 8.h),
                  ),
                  CustomTextField(
                    keyboardType: TextInputType.text,
                    hintText: 'Enter Vehicle name',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                    maxLines: 1,
                    borderRadius: 15,
                  ),
                  SizedBox(height: 20.h),
                  _FieldName(
                    name: 'Capacity',
                    padding: EdgeInsets.only(bottom: 8.h),
                  ),
                  CustomTextField(
                    keyboardType: const TextInputType.numberWithOptions(
                        decimal: true, signed: true),
                    hintText: 'Enter Vehicle capacity',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                    maxLines: 1,
                    borderRadius: 15,
                  ),
                  SizedBox(height: 20.h),
                  _FieldName(
                    name: 'Driver Name',
                    padding: EdgeInsets.only(bottom: 8.h),
                  ),
                  CustomTextField(
                    keyboardType: TextInputType.text,
                    hintText: 'Enter Driver name',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                    maxLines: 1,
                    borderRadius: 15,
                  ),
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
                  CustomTextField(
                    keyboardType: TextInputType.text,
                    hintText: 'Enter description here',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                    maxLines: 4,
                    borderRadius: 15,
                  ),
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

class _VehicleImage extends StatelessWidget {
  const _VehicleImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: 0.4.sw,
            height: 0.4.sw,
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
          Positioned(
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
        ],
      ),
    );
  }
}

class _StatusToggleButton extends StatelessWidget {
  const _StatusToggleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const _FieldName(
          name: 'Status',
          padding: EdgeInsets.only(right: 8),
        ),
        FlutterSwitch(
          value: true,
          onToggle: (value) {},
          activeColor: Colors.green.shade900,
          width: 42.w,
          height: 26.h,
          padding: 3,
        ),
      ],
    );
  }
}

class _FieldName extends StatelessWidget {
  const _FieldName({
    required this.name,
    this.padding,
    super.key,
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
