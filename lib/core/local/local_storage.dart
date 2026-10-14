import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  LocalStorage._();

  static final LocalStorage instens = LocalStorage._();

  static const _showOnboardKey = 'showOnboard';
  static const _isLoginKey = 'isLogin';

  SharedPreferences? _preferences;
  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  bool get isShowOnboard => _preferences?.getBool(_showOnboardKey) ?? false;
  bool get isLogin => _preferences?.getBool(_isLoginKey) ?? false;

  Future<void> setShowOnboard({required bool value}) async {
    await _preferences?.setBool(_showOnboardKey, value);
  }

  Future<void> setIsLogin({required bool value}) async {
    await _preferences?.setBool(_isLoginKey, value);
  }
}
