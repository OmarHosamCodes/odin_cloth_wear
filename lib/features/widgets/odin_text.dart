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
  });
  final String text;
  final TextStyle style;
  final OdinTextType type;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
        color: type == OdinTextType.title
            ? ColorConstants.titleTextColor
            : type == OdinTextType.subtitle
                ? ColorConstants.subtitleTextColor
                : type == OdinTextType.price
                    ? ColorConstants.priceTextColor
                    : Colors.black,
        fontSize: type == OdinTextType.title
            ? 12
            : type == OdinTextType.subtitle
                ? 10
                : type == OdinTextType.price
                    ? 10
                    : 12,
        fontWeight: type == OdinTextType.title
            ? FontWeight.normal
            : type == OdinTextType.subtitle
                ? FontWeight.normal
                : type == OdinTextType.price
                    ? FontWeight.normal
                    : FontWeight.normal,
        fontFamily: 'Rubik',
      ),
    );
  }
}

enum OdinTextType { title, subtitle, price }
