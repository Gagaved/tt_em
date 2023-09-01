
import 'package:flutter/material.dart';
import 'di/locator.dart';
import 'presentation/app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(const App());
}