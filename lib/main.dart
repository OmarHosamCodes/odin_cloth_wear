import 'library.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: OdinClothWear()));
}
//TODO:
//! 1. Add a new screen for the admin to add new items
//! 2. Add Shimmer effect to the loading screen
/////! 3. Add Loader Bar in splash screen
//! 4. Fix Page Controller error when routing

class OdinClothWear extends StatelessWidget {
  const OdinClothWear({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeController.theme,
      themeMode: ThemeController.themeMode,
      routerConfig: RoutingController.router,
    );
  }
}
