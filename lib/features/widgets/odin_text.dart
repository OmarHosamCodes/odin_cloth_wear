import '/library.dart';

class OdinText extends StatelessWidget {
  const OdinText({
    super.key,
    required this.text,
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
  final String text;
  final TextStyle style;
  final OdinTextType type;
  final Color? textColor;
  final double? textSize;
  final FontWeight? textWeight;
  Color get color {
    return switch (type) {
      OdinTextType.title => ColorConstants.titleTextColor,
      OdinTextType.subtitle => ColorConstants.subtitleTextColor,
      OdinTextType.price => ColorConstants.priceTextColor,
      OdinTextType.normal => ColorConstants.normalTextColor,
      OdinTextType.custom => textColor!,
    };
  }

  double get fontSize {
    return switch (type) {
      OdinTextType.title => 12,
      OdinTextType.subtitle => 10,
      OdinTextType.price => 10,
      OdinTextType.normal => 12,
      OdinTextType.custom => textSize!,
    };
  }

  FontWeight get fontWeight {
    return switch (type) {
      OdinTextType.title => FontWeight.normal,
      OdinTextType.subtitle => FontWeight.normal,
      OdinTextType.price => FontWeight.normal,
      OdinTextType.normal => FontWeight.normal,
      OdinTextType.custom => textWeight!,
    };
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

enum OdinTextType { title, subtitle, price, normal, custom }
