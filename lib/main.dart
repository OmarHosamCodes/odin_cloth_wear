import 'package:odin_cloth_wear/library.dart';

void main() async {
  if (kIsWeb) setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  Hive.registerAdapter(CartItemAdapter());
  runApp(const ProviderScope(child: OdinClothWear()));
}

/// A [StatelessWidget] that displays the Odin Cloth Wear app.
class OdinClothWear extends StatelessWidget {
  /// A [StatelessWidget] that displays the Odin Cloth Wear app.
  const OdinClothWear({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Odin Cloth Wear',
      debugShowCheckedModeBanner: false,
      theme: ThemeController.theme,
      themeMode: ThemeController.themeMode,
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 580, name: MOBILE),
          const Breakpoint(start: 580, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: double.infinity, name: DESKTOP),
        ],
      ),
      routerConfig: RoutingController.router,
    );
  }
}
