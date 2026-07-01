import 'package:flutter/foundation.dart';

class AdminFlag extends ChangeNotifier {
  bool _isAdmin = true;

  bool get isAdmin => _isAdmin;

  void setAdmin(bool value) {
    if (_isAdmin != value) {
      _isAdmin = value;
      notifyListeners();
    }
  }
}
