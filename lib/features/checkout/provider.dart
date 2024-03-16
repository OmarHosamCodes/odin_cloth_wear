import 'package:odin_cloth_wear/library.dart';

/// Repository for checkout feature
final checkoutRepositoryProvider = Provider<CheckoutRepository>(
  (ref) => CheckoutRepository(
    FirebaseFirestore.instance.collection('mail'),
  ),
);

/// A [StateNotifier] for [Mail]
class MailStateNotifier extends StateNotifier<Mail> {
  /// A [StateNotifier] for [Mail]
  MailStateNotifier(super.state);

  /// Set the [governorate]
  void setGovernorate(Governorate governorate) =>
      state = state.copyWith(governorates: governorate);

  /// Set the [name]
  void setName(String name) => state = state.copyWith(name: name);

  /// Set the [phoneNumber]
  void setPhoneNumber(String phoneNumber) =>
      state = state.copyWith(phoneNumber: phoneNumber);

  /// Set the [address]
  void setAddress(String address) => state = state.copyWith(address: address);

  /// Set the [items]
  void setItems(List<CartItem> items) => state = state.copyWith(items: items);

  /// Set the [discount]
  void setDiscount(double discount) =>
      state = state.copyWith(discount: discount);
}

/// A [StateNotifier] for [Mail]
final mailStateNotifierProvider =
    StateNotifierProvider<MailStateNotifier, Mail>(
  (ref) => MailStateNotifier(
    Mail(
      id: '',
      items: [],
      name: '',
      phoneNumber: '',
      address: '',
      governorates: GovernoratesConstants.governorates[0],
    ),
  ),
);
