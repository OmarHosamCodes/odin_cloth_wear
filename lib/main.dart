import 'library.dart';

void main() {
  runApp(const ProviderScope(child: OdinClothWear()));
}

class OdinClothWear extends StatelessWidget {
  const OdinClothWear({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Odin Cloth Wear',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
