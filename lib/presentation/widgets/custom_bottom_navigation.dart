import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int currentIndex;
  const CustomBottomNavigation({
    super.key,
    required this.currentIndex,
  });

  // int getCurrentIndex(BuildContext context) {
  //   final String location = GoRouterState.of(context).location;

  //   switch (location) {
  //     case '/':
  //       return 0;
  //     case '/locations':
  //       return 1;
  //     case '/materials':
  //       return 2;
  //     case '/transactions':
  //       return 3;

  //     default:
  //       return 0;
  //   }
  // }

  void onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/home/0');
        break;
      case 1:
        context.go('/home/1');
        break;
      case 2:
        context.go('/home/2');
        break;
      case 3:
        context.go(
          '/home/3',
          extra: const AlertDialog(),
        );
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      enableFeedback: true,
      type: BottomNavigationBarType.fixed,
      iconSize: 24.sp,
      // currentIndex: getCurrentIndex(context),
      currentIndex: currentIndex,
      onTap: (index) {
        onItemTapped(context, index);
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Ionicons.bus_outline),
          activeIcon: Icon(Ionicons.bus),
          label: 'Vehicles',
        ),
        BottomNavigationBarItem(
          icon: Icon(Ionicons.location_outline),
          activeIcon: Icon(Ionicons.location),
          label: 'Locations',
        ),
        BottomNavigationBarItem(
          icon: Icon(Ionicons.list_outline),
          activeIcon: Icon(Ionicons.list),
          label: 'Materials',
        ),
        BottomNavigationBarItem(
          icon: Icon(Ionicons.wallet_outline),
          activeIcon: Icon(Ionicons.wallet),
          label: 'Transactions',
        ),
      ],
    );
  }
}
