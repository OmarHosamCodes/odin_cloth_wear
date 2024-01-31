import '/library.dart';

class RoutingController {
  static final router = GoRouter(
    initialLocation: Routes.home,
    routes: [
      GoRoute(
        path: Routes.home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        name: Routes.itemRoot,
        path: Routes.item,
        builder: (context, state) => const ItemScreen(),
      ),
      // GoRoute(
      //   name: Routes.adminRoot,
      //   path: Routes().admin,
      //   builder: (context, state) => const AdminScreen(),
      // )

      //TODO:

      // GoRoute(
      //   path: '/cart',
      //   pageBuilder: (context, state) => const CartScreen(),
      // ),
      // GoRoute(
      //   path: '/checkout',
      //   pageBuilder: (context, state) => const CheckoutScreen(),
      // ),
    ],
  );
}
