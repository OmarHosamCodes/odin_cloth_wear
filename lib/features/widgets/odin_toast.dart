import 'package:odin_cloth_wear/library.dart';

/// A class that displays a toast message.
class OdinToast {
  /// A class that displays a toast message.
  static void showSuccessToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      textColor: ColorConstants.primaryColor,
      webBgColor: '#4CAF50',
      webPosition: 'center',
    );
  }

  /// A class that displays a toast message.
  static void showErrorToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      textColor: ColorConstants.primaryColor,
      webBgColor: '#F44336',
      webPosition: 'center',
    );
  }
}
