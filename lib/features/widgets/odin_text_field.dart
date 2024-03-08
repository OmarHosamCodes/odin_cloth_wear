import 'package:odin_cloth_wear/library.dart';

/// A [StatelessWidget] that displays the text field.
class OdinTextField extends StatelessWidget {
  /// A [StatelessWidget] that displays the text field.
  const OdinTextField({
    required this.controller,
    required this.hintText,
    required this.textInputAction,
    this.keyboardType = TextInputType.text,
    super.key,
    this.initialValue,
    this.maxLength,
    this.margin,
    this.fontSize = 16.0,
    this.fieldColor = ColorConstants.seccoundaryColor,
    this.onEditingComplete,
    this.onChanged,
    this.suffixIcon,
    this.validator,
    this.inputFormatters,
  });

  /// The controller
  final TextEditingController controller;

  /// The hint text
  final String hintText;

  /// The initial value
  final String? initialValue;

  /// The keyboard type
  final TextInputType keyboardType;

  /// The max length
  final int? maxLength;

  /// The margin
  final EdgeInsets? margin;

  /// The font size
  final double? fontSize;

  /// The field color
  final Color fieldColor;

  /// The on editing complete
  final void Function()? onEditingComplete;

  /// The on changed
  final void Function(String)? onChanged;

  /// The text input action
  final TextInputAction textInputAction;

  /// The prefix icon
  final Widget? suffixIcon;

  /// The validator
  final String? Function(String?)? validator;

  /// The input formatters
  final List<TextInputFormatter>? inputFormatters;

  /// The border radius value
  BorderRadius get borderRadiusValue => BorderRadius.circular(10);

  /// The outline input border
  OutlineInputBorder get outlineInputBorder => OutlineInputBorder(
        borderRadius: borderRadiusValue,
        borderSide: const BorderSide(
          color: ColorConstants.seccoundaryColor,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      strutStyle: const StrutStyle(height: 1),
      maxLength: maxLength,
      smartDashesType: SmartDashesType.enabled,
      smartQuotesType: SmartQuotesType.enabled,
      keyboardType: keyboardType,
      style: TextStyle(
        color: ColorConstants.primaryColor,
        fontSize: fontSize,
      ),
      textAlignVertical: TextAlignVertical.top,
      cursorColor: ColorConstants.primaryColor,
      controller: controller,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        isCollapsed: false,
        errorStyle: const TextStyle(
          color: Color(0xFFF44336),
          fontSize: 14,
        ),
        counterText: '',
        border: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        disabledBorder: outlineInputBorder,
        enabledBorder: outlineInputBorder,
        errorBorder: outlineInputBorder,
        focusedErrorBorder: outlineInputBorder,
        filled: true,
        fillColor: fieldColor.withOpacity(.5),
        hintText: hintText,
        hintStyle: const TextStyle(color: ColorConstants.primaryColor),
        contentPadding: const EdgeInsets.only(
          left: 10,
          right: 10,
          top: 10,
        ),
        suffixIcon: suffixIcon,
        suffixIconColor: ColorConstants.primaryColor,
      ),
      initialValue: initialValue,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      onEditingComplete: onEditingComplete,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
    );
  }
}
