import 'package:cat_breeds_app/di/injection.dart';
import 'package:flutter/material.dart';
import 'app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencies();
  runApp(const CatBreedsApp());
}
