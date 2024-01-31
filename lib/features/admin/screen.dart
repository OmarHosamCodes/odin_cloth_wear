import '/library.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const OdinText(text: 'Admin'),
      ),
      body: const Center(
        child: OdinText(text: 'Admin'),
      ),
    );
  }
}
