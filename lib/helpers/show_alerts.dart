// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Package imports:
import 'package:material_dialogs/material_dialogs.dart';

void showAlert(BuildContext context, String title, String msg, String buttonMsg,
    void Function()? onTap,
    {bool isCancelBtn = false}) {
  Dialogs.materialDialog(
    context: context,
    title: title,
    titleStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
    msg: msg,
    msgStyle: TextStyle(fontSize: 14.sp),
    color: Dialogs.bcgColor.withOpacity(0.9),
    actions: [
      Column(
        children: [
          const Divider(thickness: 1, height: 0),
          Row(
            mainAxisAlignment: isCancelBtn
                ? MainAxisAlignment.spaceEvenly
                : MainAxisAlignment.center,
            children: [
              isCancelBtn
                  ? FilledButton.icon(
                      icon: Icon(Icons.cancel_outlined),
                      label: Text('Cancel'),
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () => Navigator.pop(context),
                    )
                  : SizedBox(),
              FilledButton.icon(
                icon: Icon(Icons.check_circle_outline),
                label: Text(buttonMsg),
                onPressed: onTap,
              ),
            ],
          )
        ],
      )
    ],
  );
}
