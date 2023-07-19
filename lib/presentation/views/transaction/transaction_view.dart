// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:

class TransactionView extends StatelessWidget {
  static const name = 'transaction';

  const TransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Transaction',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 16.sp,
          ),
        ),
      ),
      body: Stack(
        children: [
          Center(
            child: FlutterLogo(
              size: 200.sp,
              style: FlutterLogoStyle.stacked,
              curve: Curves.bounceInOut,
              duration: const Duration(seconds: 5),
            ),
          )
        ],
      ),
    );
  }
}
