import 'package:go_router/go_router.dart';

import 'package:cobra/presentation/views/views.dart';
import '../../presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return HomeScreen(
          childView: child,
        );
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) {
            return const VehicleListView();
          },
        ),
        GoRoute(
          path: '/locations',
          builder: (context, state) {
            return const LocationListView();
          },
        ),
        GoRoute(
          path: '/materials',
          builder: (context, state) {
            return const MaterialListView();
          },
        ),
      ],
    ),
    // GoRoute(
    //   path: '/',
    //   name: HomeScreen.name,
    //   builder: (context, state) => const HomeScreen(
    //     childView: MaterialListView(),
    //   ),
    // ),
  ],
);
