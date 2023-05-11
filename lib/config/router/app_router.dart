import 'package:go_router/go_router.dart';

import 'package:cobra/presentation/views/views.dart';
import '../../presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/home/0',
  routes: [
    GoRoute(
      path: '/home/:page',
      name: HomeScreen.name,
      builder: (context, state) {
        final pageIndex = state.params['page'] ?? '0';
        return HomeScreen(
          pageIndex: int.parse(pageIndex),
        );
      },
    ),
    GoRoute(
      path: '/vehicle-creation',
      name: VehicleCreation.name,
      builder: (_, __) => const VehicleCreation(),
    ),
    GoRoute(
      path: '/material-creation',
      name: MaterialCreation.name,
      builder: (_, __) => const MaterialCreation(),
    ),
    GoRoute(
      path: '/register-screen',
      name: RegisterScreen.name,
      builder: (_, __) => const RegisterScreen(),
    ),
    GoRoute(
      path: 'login-screen',
      name: LoginScreen.name,
      builder: (context, state) => const LoginScreen(),
    )

    // ShellRoute(
    //   builder: (context, state, child) {
    //     return HomeScreen(
    //       childView: child,
    //     );
    //   },
    //   routes: [
    //     GoRoute(
    //       path: '/',
    //       builder: (context, state) {
    //         return const VehicleListView();
    //       },
    //     ),
    //     GoRoute(
    //       path: '/locations',
    //       builder: (context, state) {
    //         return const LocationListView();
    //       },
    //     ),
    //     GoRoute(
    //       path: '/materials',
    //       builder: (context, state) {
    //         return const MaterialListView();
    //       },
    //     ),
    //   ],
    // ),
  ],
);
