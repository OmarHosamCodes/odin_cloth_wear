import 'package:firebase_core/firebase_core.dart';
import 'package:odin_cloth_wear/firebase_options.dart';

import 'library.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: OdinClothWear()));
}

class OdinClothWear extends StatelessWidget {
  const OdinClothWear({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeController.theme,
      themeMode: ThemeController.themeMode,
      home: const HomeScreen(),
    );
  }
}
