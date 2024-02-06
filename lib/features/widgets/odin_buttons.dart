import '/library.dart';

class OdinElevatedButton extends StatelessWidget {
  const OdinElevatedButton({
    super.key,
    required this.child,
    this.onPressed,
  });

  final Widget child;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorConstants.cardColor,
        foregroundColor: ColorConstants.titleTextColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: child,
    );
  }
}
