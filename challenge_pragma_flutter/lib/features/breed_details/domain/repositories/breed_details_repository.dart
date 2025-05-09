import 'package:cat_breeds_app/features/breeds_list/data/models/breed_model.dart';
import 'package:dartz/dartz.dart';

abstract class BreedDetailsRepository {
  Future<Either<String, BreedModel>> getBreedById(String id);
}
