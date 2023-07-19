// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../views/views.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  final int pageIndex;

  final viewRoutes = const [
    DriverListView(),
    VehicleListView(),
    LocationListView(),
    MaterialListView(),
    MoreView(),
    // TransactionView(),
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
