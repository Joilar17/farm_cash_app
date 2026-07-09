import 'package:flutter/foundation.dart';

class FamilyAuthProvider extends ChangeNotifier {
  String? _familySpaceId;
  bool _isAuthenticated = false;

  String? get familySpaceId => _familySpaceId;
  bool get isAuthenticated => _isAuthenticated;

  // Emulates background execution setup for Anonymous Firestore spaces
  Future<void> initializeAnonymousSession() async {
    await Future.delayed(const Duration(milliseconds: 800));
    _familySpaceId = "FARM_SPACE_XM92_SHARED";
    _isAuthenticated = true;
    notifyListeners();
  }
}