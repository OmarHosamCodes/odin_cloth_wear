// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:odin_cloth_wear/library.dart';

/// [CheckoutScreen] is a [ConsumerStatefulWidget]
/// that displays the checkout screen.
class CheckoutScreen extends ConsumerStatefulWidget {
  /// [CheckoutScreen] constructor
  const CheckoutScreen({
    required this.cart,
    super.key,
  });

  /// The [List] of [CartItem]s to checkout.
  final List<CartItem> cart;

  @override
  CheckoutScreenState createState() => CheckoutScreenState();
}

/// [CheckoutScreenState] is the state of the [CheckoutScreen].
class CheckoutScreenState extends ConsumerState<CheckoutScreen> {
  /// [nameController] is the [TextEditingController] for the name field.
  late TextEditingController nameController;

  /// [phoneController] is the [TextEditingController] for the phone field.
  late TextEditingController phoneController;

  /// [addressController] is the [TextEditingController] for the address field.
  late TextEditingController addressController;

  /// [couponController] is the [TextEditingController] for the coupon field.
  late TextEditingController couponController;

  /// [formKey] is the [GlobalKey] for the form.
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    addressController = TextEditingController();
    couponController = TextEditingController();
    Future(
      () => ref.read(mailStateNotifierProvider.notifier).setItems(widget.cart),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    couponController.dispose();
    super.dispose();
  }

  String? Function(String?)? get validator => (value) {
        if (value!.isEmpty) {
          return 'Please enter some input';
        }
        return null;
      };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Consumer(
                    builder: (_, WidgetRef ref, __) {
                      return OdinTextField(
                        controller: nameController,
                        hintText: 'Enter your name',
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        onChanged: (_) {
                          ref.read(mailStateNotifierProvider.notifier).setName(
                                nameController.text,
                              );
                        },
                        validator: validator,
                        inputFormatters: [
                          FilteringTextInputFormatter.singleLineFormatter,
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  Consumer(
                    builder: (_, WidgetRef ref, __) {
                      return OdinTextField(
                        controller: phoneController,
                        hintText: 'Enter your phone number',
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.phone,
                        onChanged: (_) {
                          ref
                              .read(mailStateNotifierProvider.notifier)
                              .setPhoneNumber(
                                phoneController.text,
                              );
                        },
                        validator: validator,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(11),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  Consumer(
                    builder: (_, WidgetRef ref, __) {
                      return OdinTextField(
                        controller: addressController,
                        hintText: 'Enter your address',
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.streetAddress,
                        onChanged: (_) {
                          ref
                              .read(mailStateNotifierProvider.notifier)
                              .setAddress(
                                addressController.text,
                              );
                        },
                        validator: validator,
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  const GovernorateDropdown(),
                  const SizedBox(height: 20),
                  const CouponField(),
                  for (final e in widget.cart)
                    CartItemTile(
                      cartItem: e,
                      showDetails: false,
                    ),
                  Row(
                    children: [
                      Expanded(
                        child: Consumer(
                          builder: (_, WidgetRef ref, __) {
                            return OdinElevatedButton(
                              child: const OdinText(text: 'Checkout'),
                              onPressed: () {
                                final state = ref.read(
                                  mailStateNotifierProvider,
                                );
                                if (formKey.currentState!.validate()) {
                                  CheckoutRepository.checkout(
                                    items: widget.cart,
                                    userName: state.name,
                                    phoneNumber: state.phoneNumber,
                                    id: '0',
                                    address: state.address,
                                    governorates: state.governorates,
                                    context: context,
                                  );
                                }
                              },
                            );
                          },
                        ),
                      ),
                      Consumer(
                        builder: (_, WidgetRef ref, __) {
                          final total = ref.watch(
                            mailStateNotifierProvider
                                .select((value) => value.total),
                          );

                          return Row(
                            children: [
                              OdinText(
                                text: 'Total: $total EGP',
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// A [StatelessWidget] that displays a coupon field.
class CouponField extends ConsumerStatefulWidget {
  /// A [StatelessWidget] that displays a coupon field.
  const CouponField({
    super.key,
  });

  /// The [TextEditingController] for the coupon field.

  @override
  ConsumerState<CouponField> createState() => _CouponFieldState();
}

class _CouponFieldState extends ConsumerState<CouponField> {
  late TextEditingController couponController;
  @override
  void initState() {
    super.initState();
    couponController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    couponController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final assetsWatcher = ref.watch(assetsProvider);

    return assetsWatcher.maybeWhen(
      data: (assets) {
        final coupons = List<Map<String, dynamic>>.from(assets.coupons);
        return OdinTextField(
          controller: couponController,
          hintText: 'Enter your coupon',
          suffixIcon: coupons.any(
            (element) => element['name'] == couponController.text,
          )
              ? OdinChip(
                  label: OdinText(
                    text: '${ref.watch(
                      mailStateNotifierProvider
                          .select((value) => value.discount),
                    )}% OFF!',
                  ),
                )
              : const OdinChip(
                  label: OdinText(
                    text: 'Invalid coupon',
                  ),
                ),
          textInputAction: TextInputAction.done,
          onEditingComplete: () {
            final discount = double.tryParse(
              coupons
                  .firstWhere(
                    (element) => element['name'] == couponController.text,
                  )['value']
                  .toString(),
            )!;
            ref
              ..invalidate(assetsProvider)
              ..read(assetsProvider)
              ..read(mailStateNotifierProvider.notifier).setDiscount(
                discount,
              );
          },
        );
      },
      orElse: () => const Center(
        child: CircularProgressIndicator(
          color: ColorConstants.primaryColor,
        ),
      ),
    );
  }
}
