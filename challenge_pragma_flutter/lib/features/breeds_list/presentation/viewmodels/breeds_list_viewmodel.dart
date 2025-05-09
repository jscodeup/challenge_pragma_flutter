import 'package:cat_breeds_app/features/breeds_list/data/models/breed_model.dart';
import 'package:cat_breeds_app/features/breeds_list/domain/repositories/breeds_repository.dart';
import 'package:flutter/material.dart';

enum ViewState { initial, loading, loaded, error }

class BreedsListViewModel extends ChangeNotifier {
  final BreedsRepository repository;

  ViewState _state = ViewState.initial;
  List<BreedModel> _breeds = [];
  String _errorMessage = '';

  ViewState get state => _state;
  List<BreedModel> get breeds => _breeds;
  String get errorMessage => _errorMessage;
  bool get isLoading => _state == ViewState.loading;
  bool get hasError => _state == ViewState.error;

  BreedsListViewModel({required this.repository});

  Future<void> getBreeds() async {
    _state = ViewState.loading;
    notifyListeners();

    try {
      _breeds = await repository.getBreeds();
      _state = ViewState.loaded;
    } catch (e) {
      _state = ViewState.error;
      _errorMessage = e.toString();
    }

    notifyListeners();
  }

  // Método de ayuda para filtrar razas por nombre
  List<BreedModel> filterBreedsByName(String query) {
    if (query.isEmpty) return _breeds;

    final lowercaseQuery = query.toLowerCase();
    return _breeds
        .where((breed) => breed.name.toLowerCase().contains(lowercaseQuery))
        .toList();
  }

  // Método para ordenar razas por diferentes criterios
  void sortBreeds({required String by, bool ascending = true}) {
    switch (by) {
      case 'name':
        _breeds.sort((a, b) =>
            ascending ? a.name.compareTo(b.name) : b.name.compareTo(a.name));
        break;
      case 'intelligence':
        _breeds.sort((a, b) => ascending
            ? a.intelligence.compareTo(b.intelligence)
            : b.intelligence.compareTo(a.intelligence));
        break;
      case 'origin':
        _breeds.sort((a, b) => ascending
            ? a.origin.compareTo(b.origin)
            : b.origin.compareTo(a.origin));
        break;
    }
    notifyListeners();
  }
}
