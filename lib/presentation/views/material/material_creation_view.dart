// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';

// Project imports:
import '../../widgets/widgets.dart';

class MaterialCreation extends StatelessWidget {
  static const name = 'material-creation';

  const MaterialCreation({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> materialList = [
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
          'Create Material',
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
                  _FieldName(
                    name: 'Name',
                    padding: EdgeInsets.only(bottom: 8.h),
                  ),
                  // CustomTextFormField(
                  //   textEditingController: ,
                  //   keyboardType: TextInputType.text,
                  //   hintText: 'Enter Material name',
                  //   contentPadding:
                  //       EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                  //   maxLines: 1,
                  //   borderRadius: 15,
                  // ),
                  // SizedBox(height: 20.h),
                  // const _StatusToggleButton(),
                  // SizedBox(height: 20.h),
                  // _FieldName(
                  //   name: 'Description',
                  //   padding: EdgeInsets.only(bottom: 8.h),
                  // ),
                  // CustomTextFormField(
                  //   textEditingController: ,
                  //   keyboardType: TextInputType.text,
                  //   hintText: 'Enter description here',
                  //   contentPadding:
                  //       EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                  //   maxLines: 3,
                  //   borderRadius: 15,
                  // ),
                  // SizedBox(height: 20.h),
                  // _FieldName(
                  //   name: 'Price',
                  //   padding: EdgeInsets.only(bottom: 8.h),
                  // ),
                  // CustomTextFormField(
                  //   textEditingController: ,
                  //   keyboardType: const TextInputType.numberWithOptions(
                  //       decimal: true, signed: true),
                  //   prefixIcon: const Icon(Ionicons.logo_usd),
                  //   hintText: 'Enter price here',
                  //   contentPadding:
                  //       EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                  //   maxLines: 1,
                  //   borderRadius: 15,
                  // ),
                  SizedBox(height: 20.h),
                  const _FieldName(name: 'Material Type'),
                  CustomDropdownButton(
                    items: materialList,
                    hint: 'Select Material type',
                  ),
                  SizedBox(height: 20.h),
                  const _FieldName(name: 'Unit of Measure'),
                  CustomDropdownButton(
                    items: unitList,
                    hint: 'Select Unit of measure',
                  ),
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
