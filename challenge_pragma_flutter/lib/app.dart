import 'package:cat_breeds_app/config/routes.dart';
import 'package:cat_breeds_app/config/theme.dart';
import 'package:flutter/material.dart';

class CatBreedsApp extends StatelessWidget {
  const CatBreedsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cat Breeds',
      theme: appTheme,
      onGenerateRoute: generateRoute,
      initialRoute: AppRoutes.breedsList,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cat Breeds')),
      body: const Center(child: Text('Welcome to Cat Breeds App')),
    );
  }
}
