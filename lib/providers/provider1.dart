import 'package:flutter/material.dart';

class UserNameProvider extends ChangeNotifier {
  String _username = '';
  // a getter to return the private variable: _username
  String get getUsername => _username;
  // a regular method to set the new value "username" to _username
  void updateUsername(String username) {
    _username = username;
    // notifyListeners() is like setState but only for widgets that uses this data,
    // so it notifies the provider that a rebuild should happen for a widget that
    // listening for changes.
    notifyListeners();
  }

  void clearUsername() {
    _username = '';
    notifyListeners();
  }
}
