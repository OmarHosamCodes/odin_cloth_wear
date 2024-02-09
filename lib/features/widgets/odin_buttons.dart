import 'package:odin_cloth_wear/library.dart';

/// A [OdinElevatedButton] Custom Widget.
class OdinElevatedButton extends StatelessWidget {
  /// A [OdinElevatedButton] Custom Widget.
  const OdinElevatedButton({
    required this.child,
    super.key,
    this.onPressed,
    this.color = ColorConstants.seccoundaryColor,
  });

  /// The [Widget] to display.
  final Widget child;

  /// The [Color] of the button.
  final Color color;

  /// The [Function] to display.
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: ColorConstants.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: child,
    );
  }
}
