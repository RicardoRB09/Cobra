import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  int getCurrentIndex(BuildContext context) {
    final String location = GoRouterState.of(context).location;

    switch (location) {
      case '/':
        return 0;
      case '/locations':
        return 1;
      case '/materials':
        return 2;
      case '/transactions':
        return 3;

      default:
        return 0;
    }
  }

  void onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/');
        break;
      case 1:
        context.go('/locations');
        break;
      case 2:
        context.go('/materials');
        break;
      case 3:
        context.go('/transactions', extra: AlertDialog());
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
      currentIndex: getCurrentIndex(context),
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
