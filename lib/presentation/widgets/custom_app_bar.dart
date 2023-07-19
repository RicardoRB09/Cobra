import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    this.title,
    this.actions,
    this.isLeadingRequired = false,
    super.key,
  });

  final String? title;
  final List<Widget>? actions;
  final bool isLeadingRequired;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: Colors.black38,
      elevation: 3,
      centerTitle: true,
      leading: isLeadingRequired
          ? InkWell(
              onTap: () {
                context.pop();
              },
              child: Icon(
                Ionicons.chevron_back_outline,
                color: Colors.green.shade800,
              ),
            )
          : SizedBox(),
      title: Text(
        title ?? '',
        style: TextStyle(
          color: Colors.black87,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
