import 'package:flutter/material.dart';

import '../views/views.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  final Widget childView;
  // final int pageIndex;

  const HomeScreen({
    super.key,
    required this.childView,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: MaterialListView(),
      body: childView,
      bottomNavigationBar: const CustomBottomNavigation(),
    );
  }
}
