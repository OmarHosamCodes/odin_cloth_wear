import 'package:odin_cloth_wear/library.dart';

/// [RoutingRepository].
class RoutingRepository {
  /// [router].
  static final router = GoRouter(
    initialLocation: Routes.shop,
    routes: [
      ShellRoute(
        builder: (context, state, child) => RoutingScreen(child: child),
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
              cachedItem: state.extra as Item?,
            ),
          ),
          GoRoute(
            name: Routes.searchRoot,
            path: Routes.search,
            builder: (context, state) => SearchScreen(
              query: state.uri.queryParameters['query']!,
              type: state.uri.queryParameters['type'] ??
                  SearchTypeConstants.query,
            ),
          ),
          GoRoute(
            name: Routes.cartRoot,
            path: Routes.cart,
            builder: (context, state) => const CartScreen(),
          ),
          GoRoute(
            name: Routes.checkoutRoot,
            path: Routes.checkout,
            builder: (context, state) => CheckoutScreen(
              cart: state.extra! as List<CartItem>,
            ),
          ),
          GoRoute(
            name: Routes.shopRoot,
            path: Routes.shop,
            builder: (context, state) => const ShopScreen(),
          ),
        ],
      ),
      GoRoute(
        name: Routes.contactRoot,
        path: Routes.contact,
        builder: (context, state) => ContactScreem(
          info: state.extra! as String,
        ),
      ),
      GoRoute(
        path: Routes.pageNotFound,
        builder: (context, state) => const PageNotFoundScreen(),
      ),
    ],
  );
}
