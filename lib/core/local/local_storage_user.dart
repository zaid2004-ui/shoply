import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shoply_app/model/login/response_login.dart';

class LocalStorageUser {
  LocalStorageUser._();
  static final LocalStorageUser instens = LocalStorageUser._();
  static const _userKey = 'user';

  final _secureStorage = const FlutterSecureStorage();

  ResponseLogin? _user;

  String get uid => _user?.uid ?? '';
  String get email => _user?.email ?? '';
  String get name => _user?.name ?? '';
  String get phone => _user?.phone ?? '';
  String get profileImage => _user?.profileImage ?? '';

  Future<void> saveUser(ResponseLogin user) async {
    _user = user;
    await _secureStorage.write(key: _userKey, value: jsonEncode(user.toJson()));
  }

  Future<void> loadUser() async {
    final raw = await _secureStorage.read(key: _userKey);
    if (raw == null) return;

    _user = ResponseLogin.fromJson(jsonDecode(raw) as Map<String, dynamic>);
  }

  Future<void> clear() async {
    _user = null;
    await _secureStorage.delete(key: _userKey);
  }
}
