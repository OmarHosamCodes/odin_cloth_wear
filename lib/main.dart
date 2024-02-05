import 'library.dart';

void main() async {
  // if (kIsWeb) setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Hive.initFlutter();
  runApp(const ProviderScope(child: OdinClothWear()));
}
//TODO:
//! 1. Add a new screen for the admin to add new items
//! 2. Add Shimmer effect to the loading screen
/////! 3. Add Loader Bar in splash screen
//! 4. Fix Page Controller error when routing
//! 5. Add Repositories for each model
//! 6. Add Hive Local DB for cart

class OdinClothWear extends StatelessWidget {
  const OdinClothWear({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppConstants.appName,
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
