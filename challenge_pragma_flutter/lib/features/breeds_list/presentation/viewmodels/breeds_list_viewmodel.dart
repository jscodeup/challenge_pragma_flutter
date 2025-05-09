import 'package:cat_breeds_app/features/breeds_list/data/models/breed_model.dart';
import 'package:cat_breeds_app/features/breeds_list/domain/repositories/breeds_repository.dart';
import 'package:flutter/material.dart';

class BreedsListViewModel extends ChangeNotifier {
  final BreedsRepository repository;

  List<BreedModel> _breeds = [];
  bool _isLoading = false;
  String? _error;

  List<BreedModel> get breeds => _breeds;
  bool get isLoading => _isLoading;
  String? get error => _error;

  BreedsListViewModel({required this.repository});

  Future<void> getBreeds() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _breeds = await repository.getBreeds();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _error = e.toString();
      notifyListeners();
    }
  }
}
