import 'package:flutter/material.dart';
import 'package:shoply_app/dependencies/main/main_dependency.dart';
import 'package:shoply_app/features/app/view/shoply_app.dart';

void main() async {
  await MainDependency.mainInitDependency();
  runApp(const ShoplyApp());
}
