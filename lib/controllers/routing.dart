import 'package:odin_cloth_wear/library.dart';

/// Routing Controller.
class RoutingController {
  /// Routing Controller.
  static final router = GoRouter(
    initialLocation: Routes.home,
    routes: [
      GoRoute(
        name: Routes.homeRoot,
        path: Routes.home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        name: Routes.itemRoot,
        path: Routes.item,
        builder: (context, state) => ItemScreen(
          id: state.pathParameters['id']!,
        ),
        // redirect: (context, state) async {
        //   final itemRepo = ItemRepository(FirebaseFirestore.instance);
        //   final Item? item =
        //       (await itemRepo.getById(state.pathParameters['id']!)).$1;
        //   if (item == null) {
        //     return Routes.pageNotFound;
        //   }
        //   return null;
        // },
      ),

      GoRoute(
        name: Routes.cartRoot,
        path: Routes.cart,
        builder: (context, state) => const CartScreen(),
      ),
      // GoRoute(
      //   path: '/checkout',
      //   pageBuilder: (context, state) => const CheckoutScreen(),
      // ),

      GoRoute(
        path: Routes.pageNotFound,
        builder: (context, state) => const PageNotFoundScreen(),
      ),
    ],
  );
}
