// Dart imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int currentIndex;
  const CustomBottomNavigation({
    super.key,
    required this.currentIndex,
  });

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
        context.go('/home/3');
        break;
      case 4:
        context.go('/home/4');
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
          icon: Icon(Ionicons.person_outline),
          activeIcon: Icon(Ionicons.person),
          label: 'Drivers',
        ),
        BottomNavigationBarItem(
          icon: Icon(Ionicons.bus_outline),
          activeIcon: Icon(Ionicons.bus),
          label: 'Vehicles',
        ),
        BottomNavigationBarItem(
          icon: Icon(Ionicons.map_outline),
          activeIcon: Icon(Ionicons.map),
          label: 'Places',
        ),
        BottomNavigationBarItem(
          icon: Icon(Ionicons.construct_outline),
          activeIcon: Icon(Ionicons.construct),
          label: 'Materials',
        ),
        BottomNavigationBarItem(
          icon: Icon(Ionicons.reorder_three_outline),
          activeIcon: Icon(Ionicons.reorder_four_outline),
          label: 'More',
        ),
      ],
    );
  }
}
