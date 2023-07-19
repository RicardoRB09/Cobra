// Flutter imports:

import 'package:cobra/presentation/providers/driver_provider.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

// Project imports:
import '../../../helpers/show_alerts.dart';
import '../../widgets/widgets.dart';

class DriverCreationView extends StatelessWidget {
  static const name = 'driver-creation';

  const DriverCreationView({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> driverGlobalKey = GlobalKey<FormState>();
    final driverPrvdr = Provider.of<DriverProvider>(context);

    void doneButtonAction() async {
      if (driverGlobalKey.currentState != null &&
          !driverGlobalKey.currentState!.validate()) return;

      await driverPrvdr.createDriver(
        driverPrvdr.nameCtrl.text.trim(),
        driverPrvdr.lastNameCtrl.text.trim(),
        driverPrvdr.idCtrl.text.trim(),
        driverPrvdr.addressCtrl.text.trim(),
        'picture',
        int.parse(driverPrvdr.vehicleIdCtrl.text),
        context,
      );
    }

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Create a new Driver',
        isLeadingRequired: true,
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            style: TextButton.styleFrom(
                enableFeedback: true, foregroundColor: Colors.grey),
            child: TextButton(
              onPressed: () => doneButtonAction(),
              child: Text(
                'Done',
                style: TextStyle(color: Colors.green.shade800, fontSize: 16.sp),
              ),
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
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.w),
                padding: EdgeInsets.fromLTRB(20.w, 20.w, 20.w, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: Colors.green.shade200.withOpacity(0.2),
                ),
                child: _DriverForm(
                  driverGlobalkey: driverGlobalKey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DriverForm extends StatelessWidget {
  const _DriverForm({this.driverGlobalkey});

  final Key? driverGlobalkey;

  @override
  Widget build(BuildContext context) {
    final driverPrvdr = Provider.of<DriverProvider>(context);
    return Form(
      key: driverGlobalkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: CustomCircleAvatar(diameter: 0.3.sw)),
          SizedBox(height: 24.h),
          _FieldName(
            name: 'Name',
            padding: EdgeInsets.only(bottom: 8.h),
          ),
          CustomTextFormField(
            textEditingController: driverPrvdr.nameCtrl,
            keyboardType: TextInputType.text,
            hintText: 'Enter your name',
            prefixIcon: Icon(Ionicons.person_circle_outline,
                color: Colors.green.shade800),
            contentPadding:
                EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
            maxLines: 1,
            borderRadius: 15,
            validator: (value) => driverPrvdr.textFieldValidator(value!),
          ),
          SizedBox(height: 20.h),
          _FieldName(
            name: 'Last name',
            padding: EdgeInsets.only(bottom: 8.h),
          ),
          CustomTextFormField(
            textEditingController: driverPrvdr.lastNameCtrl,
            keyboardType: TextInputType.text,
            hintText: 'Enter your last name',
            prefixIcon: Icon(Ionicons.person_circle_outline,
                color: Colors.green.shade800),
            contentPadding:
                EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
            maxLines: 1,
            borderRadius: 15,
            validator: (value) => driverPrvdr.textFieldValidator(value!),
          ),
          SizedBox(height: 20.h),
          _FieldName(
            name: 'Identification',
            padding: EdgeInsets.only(bottom: 8.h),
          ),
          CustomTextFormField(
            textEditingController: driverPrvdr.idCtrl,
            keyboardType: TextInputType.text,
            hintText: 'Enter your ID',
            prefixIcon:
                Icon(Ionicons.person_outline, color: Colors.green.shade800),
            contentPadding:
                EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
            maxLines: 1,
            borderRadius: 15,
            validator: (value) => driverPrvdr.textFieldValidator(value!),
          ),
          SizedBox(height: 20.h),
          const _FieldName(name: 'Address'),
          CustomTextFormField(
            textEditingController: driverPrvdr.addressCtrl,
            keyboardType: TextInputType.streetAddress,
            hintText: 'Enter your address',
            prefixIcon:
                Icon(Ionicons.location_outline, color: Colors.green.shade800),
            contentPadding:
                EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
            maxLines: 1,
            borderRadius: 15,
            validator: (value) => driverPrvdr.textFieldValidator(value!),
          ),
          SizedBox(height: 20.h),
          _FieldName(
            name: 'Vehicle ID',
            padding: EdgeInsets.only(bottom: 8.h),
          ),
          CustomTextFormField(
            textEditingController: driverPrvdr.vehicleIdCtrl,
            keyboardType: TextInputType.number,
            hintText: 'Enter assigned vehicle ID',
            prefixIcon:
                Icon(Ionicons.bus_outline, color: Colors.green.shade800),
            contentPadding:
                EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
            maxLines: 1,
            borderRadius: 15,
            validator: (value) => driverPrvdr.textFieldValidator(value!),
          ),
          SizedBox(height: 20.h),
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
