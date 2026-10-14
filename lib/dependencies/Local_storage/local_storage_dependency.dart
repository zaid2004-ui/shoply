import 'package:shoply_app/core/local/local_storage.dart';

class LocalStorageDependency {
  static Future<void> initLocalStorageDependency() async {
    await LocalStorage.instens.init();
  }
}
