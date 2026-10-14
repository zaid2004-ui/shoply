import 'package:flutter/material.dart';
import 'package:shoply_app/dependencies/Local_storage/local_storage_dependency.dart';
import 'package:shoply_app/dependencies/fierbase/firebase_dependency.dart';

class MainDependency {
  static Future<void> mainInitDependency() async {
    WidgetsFlutterBinding.ensureInitialized();
    await LocalStorageDependency.initLocalStorageDependency();
    await FirebaseDependency.initFirebaseDependency();
  }
}
