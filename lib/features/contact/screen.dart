import 'package:odin_cloth_wear/library.dart';

/// A [StatelessWidget] that displays the contact screen.
class ContactScreem extends StatelessWidget {
  /// A [StatelessWidget] that displays the contact screen.
  const ContactScreem({required this.info, super.key});

  /// The contact information.
  final String info;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Markdown(
        data: info,
      ),
    );
  }
}
