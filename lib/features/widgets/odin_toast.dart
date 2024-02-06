import '/library.dart';

class OdinToast {
  static void showSuccessToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      textColor: ColorConstants.titleTextColor,
      webBgColor: '#4CAF50',
      webPosition: 'center',
    );
  }

  static void showErrorToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      textColor: ColorConstants.titleTextColor,
      webBgColor: '#F44336',
      webPosition: 'center',
    );
  }
}
