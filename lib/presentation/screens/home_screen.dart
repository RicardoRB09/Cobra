import 'package:cobra/presentation/screens/user/login_screen.dart';
import 'package:flutter/material.dart';

import '../views/views.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  final int pageIndex;

  final viewRoutes = const [
    VehicleListView(),
    LocationListView(),
    MaterialListView(),
    LoginScreen(),
  ];

  const HomeScreen({
    super.key,
    required this.pageIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: viewRoutes,
      ),
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: pageIndex,
      ),
    );
  }
}
