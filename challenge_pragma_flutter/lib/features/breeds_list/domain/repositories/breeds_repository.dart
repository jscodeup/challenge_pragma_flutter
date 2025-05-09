import 'package:cat_breeds_app/features/breeds_list/data/models/breed_model.dart';

abstract class BreedsRepository {
  Future<List<BreedModel>> getBreeds();
  Future<BreedModel?> getBreedById(String id);
}
