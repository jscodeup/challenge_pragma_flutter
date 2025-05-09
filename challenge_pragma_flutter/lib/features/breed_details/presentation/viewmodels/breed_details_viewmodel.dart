import 'package:cat_breeds_app/features/breed_details/domain/repositories/breed_details_repository.dart';
import 'package:cat_breeds_app/features/breeds_list/data/models/breed_model.dart';
import 'package:flutter/material.dart';

enum ViewState { initial, loading, loaded, error }

class BreedDetailsViewModel extends ChangeNotifier {
  final BreedDetailsRepository repository;

  ViewState _state = ViewState.initial;
  BreedModel? _breed;
  String _errorMessage = '';
  String _breedId = '';

  ViewState get state => _state;
  BreedModel? get breed => _breed;
  String get errorMessage => _errorMessage;
  String get breedId => _breedId;

  BreedDetailsViewModel({required this.repository});

  Future<void> getBreedById(String id) async {
    _breedId = id;
    _state = ViewState.loading;
    notifyListeners();

    final result = await repository.getBreedById(id);

    result.fold(
      (error) {
        _state = ViewState.error;
        _errorMessage = error;
      },
      (breed) {
        _state = ViewState.loaded;
        _breed = breed;
      },
    );

    notifyListeners();
  }

  // Métodos para las redes sociales, compartir y favoritos

  void shareBreed() {
    // Implementación real usaría el paquete share_plus
    print('Compartiendo información sobre ${_breed?.name}');
  }

  void toggleFavorite() {
    // Implementación real guardaría en SharedPreferences o una base de datos local
    print('Añadiendo/Quitando ${_breed?.name} de favoritos');
  }

  void openWikipedia() {
    // Implementación real abriría URL con url_launcher
    if (_breed?.wikipediaUrl != null) {
      print('Abriendo Wikipedia: ${_breed?.wikipediaUrl}');
    }
  }

  // Método para navegar a una búsqueda por país de origen
  void searchByOrigin() {
    // En una implementación real, usaríamos Navigator para navegar a una pantalla filtrada
    print('Buscando más razas de ${_breed?.origin}');
  }
}
