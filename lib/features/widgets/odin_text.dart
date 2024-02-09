import 'package:odin_cloth_wear/library.dart';

/// A custom text widget that applies different styles based
/// on the [OdinTextType].
///
/// The [OdinText] widget is used to display text with different styles such
/// as title, subtitle, price, normal, or custom.
/// It takes in a [text] parameter which is the text to be displayed,
/// and applies the appropriate style based on the [type] parameter.
/// The [style] parameter can be used to override the default text style.
/// The [textColor], [textSize],
/// and [textWeight] parameters can be used to customize the text style further.
///
/// Example usage:
/// ```dart
/// OdinText(
///   text: 'Hello World',
///   type: OdinTextType.title,
///   textColor: Colors.red,
///   textSize: 20,
///   textWeight: FontWeight.bold,
/// )
/// ```
class OdinText extends StatelessWidget {
  /// A custom text widget that applies different styles based on
  /// the [OdinTextType].
  const OdinText({
    required this.text,
    super.key,
    this.style = const TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
    this.type = OdinTextType.title,
    this.textColor,
    this.textSize,
    this.textWeight,
  });

  /// The text to be displayed.
  final String text;

  /// The style to be applied to the text.
  final TextStyle style;

  /// The type of text style to be applied.
  final OdinTextType type;

  /// The color of the text. If [type] is [OdinTextType.custom],
  /// this color will be used.
  final Color? textColor;

  /// The size of the text. If [type] is [OdinTextType.custom],
  /// this size will be used.
  final double? textSize;

  /// The weight of the text. If [type] is [OdinTextType.custom],
  /// this weight will be used.
  final FontWeight? textWeight;

  /// Returns the color based on the [type].
  Color get color {
    switch (type) {
      case OdinTextType.custom:
        return textColor!;
      // ignore: no_default_cases
      default:
        return ColorConstants.primaryColor;
    }
  }

  /// Returns the font size based on the [type].
  double get fontSize {
    switch (type) {
      case OdinTextType.title:
        return 12;
      case OdinTextType.subtitle:
        return 10;
      case OdinTextType.price:
        return 10;
      case OdinTextType.normal:
        return 12;
      case OdinTextType.custom:
        return textSize!;
    }
  }

  /// Returns the font weight based on the [type].
  FontWeight get fontWeight {
    switch (type) {
      case OdinTextType.title:
        return FontWeight.normal;
      case OdinTextType.subtitle:
        return FontWeight.normal;
      case OdinTextType.price:
        return FontWeight.normal;
      case OdinTextType.normal:
        return FontWeight.normal;
      case OdinTextType.custom:
        return textWeight!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: 'Roboto',
        letterSpacing: 0.4,
      ),
    );
  }
}

/// Enum representing the different types of text styles for [OdinText].

enum OdinTextType {
  /// A title text style.
  title,

  /// A subtitle text style.
  subtitle,

  /// A price text style.
  price,

  /// A normal text style.
  normal,

  /// A custom text style.
  custom,
}
