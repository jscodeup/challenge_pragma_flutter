import 'package:flutter/material.dart';
import '../features/breeds_list/presentation/screens/breeds_list_screen.dart';

class AppRoutes {
  static const String breedsList = '/';
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.breedsList:
      return MaterialPageRoute(builder: (_) => const BreedsListScreen());
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('Ruta no encontrada: ${settings.name}'),
          ),
        ),
      );
  }
}
