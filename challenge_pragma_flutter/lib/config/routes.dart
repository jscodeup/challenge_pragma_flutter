import 'package:cat_breeds_app/features/breed_details/presentation/screens/breed_details_screen.dart';
import 'package:flutter/material.dart';
import '../features/breeds_list/presentation/screens/breeds_list_screen.dart';

class AppRoutes {
  static const String breedsList = '/';
  static const String breedDetails = '/breed-details';
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.breedsList:
      return MaterialPageRoute(builder: (_) => const BreedsListScreen());
    case AppRoutes.breedDetails:
      final breedId = settings.arguments as String;
      return MaterialPageRoute(
        builder: (_) => BreedDetailsScreen(breedId: breedId),
      );
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
