// ignore: avoid_web_libraries_in_flutter
// ignore_for_file: use_build_context_synchronously

import 'package:odin_cloth_wear/library.dart';

/// A repository for [Mail]
class CheckoutRepository {
  /// A repository for [Mail]
  CheckoutRepository(this._mailCollection);
  final CollectionReference _mailCollection;

  /// A singleton instance of [CheckoutRepository]
  static final CheckoutRepository instance =
      CheckoutRepository(FirebaseFirestore.instance.collection('mail'));

  /// Checkout
  static Future<void> checkout({
    required List<CartItem> items,
    required String userName,
    required String phoneNumber,
    required String id,
    required String address,
    required String governorates,
    required BuildContext context,
  }) async {
    final mail = Mail(
      items: items,
      name: userName,
      phoneNumber: phoneNumber,
      id: id,
      address: address,
      governorates: governorates,
    );

    try {
      await instance._mailCollection.add(mail.toJson());
      showReceipt(context);
    } catch (e) {
      OdinToast.showErrorToast('Error: $e');
    }
  }
}
