import 'package:cat_breeds_app/features/breeds_list/data/datasources/breeds_remote_data_source.dart';
import 'package:cat_breeds_app/features/breeds_list/data/models/breed_model.dart';
import 'package:cat_breeds_app/features/breeds_list/domain/repositories/breeds_repository.dart';

class BreedsRepositoryImpl implements BreedsRepository {
  final BreedsRemoteDataSource remoteDataSource;

  BreedsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<BreedModel>> getBreeds() async {
    return await remoteDataSource.getBreeds();
  }

  @override
  Future<BreedModel?> getBreedById(String id) async {
    final breeds = await remoteDataSource.getBreeds();
    try {
      return breeds.firstWhere((breed) => breed.id == id);
    } catch (e) {
      return null;
    }
  }
}
