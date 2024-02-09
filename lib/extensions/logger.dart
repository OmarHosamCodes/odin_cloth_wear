import 'package:flutter/foundation.dart';

/// A logger extension.
extension Logger on Object {
  /// Logs the object.
  void log() {
    if (kDebugMode) {
      print(this);
    }
  }
}
