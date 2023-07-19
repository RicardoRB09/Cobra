import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

import '../../helpers/show_alerts.dart';
import '../../services/auth_service.dart';

class MoreView extends StatelessWidget {
  const MoreView({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    // final loginPvdr = Provider.of<LoginProvider>(context);

    return SafeArea(
        child: Scaffold(
      appBar: _CustomAppBar(
        email: authService.savedEmail,
      ),
      body: Column(
        children: const [
          CloseSectionListTile(),
        ],
      ),
    ));
  }
}

class CloseSectionListTile extends StatelessWidget {
  const CloseSectionListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      enableFeedback: true,
      contentPadding: const EdgeInsets.all(0),
      minLeadingWidth: 0,
      leading: Padding(
        padding: EdgeInsets.only(left: 8.w),
        child: Icon(
          Ionicons.person_circle,
          size: 32.sp,
        ),
      ),
      title: Text(
        'Logout',
        style: TextStyle(fontSize: 14.sp),
      ),
      trailing: IconButton(
        onPressed: () {
          showAlert(
            context,
            'Closing session...',
            'Are you sure you want to continue?',
            'Yes',
            () {
              context.pushReplacement('/login-screen');
              AuthService.deleteToken();
            },
            isCancelBtn: true,
          );
        },
        icon: const Icon(
          Icons.power_settings_new_outlined,
        ),
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _CustomAppBar({
    required this.email,
  });

  final String email;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Icon(
        Ionicons.person_circle_outline,
        size: 40.sp,
      ),
      title: RichText(
        text: TextSpan(
          text: 'Hello, ',
          children: [
            TextSpan(
              text: email,
              style: const TextStyle(fontWeight: FontWeight.w800),
            )
          ],
          // style: DefaultTextStyle.of(context).style,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 16.sp,
          ),
        ),
      ),
      titleSpacing: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
