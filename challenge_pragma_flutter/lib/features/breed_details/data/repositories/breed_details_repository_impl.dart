import 'package:dartz/dartz.dart';
import 'package:cat_breeds_app/core/error/exceptions.dart';
import 'package:cat_breeds_app/features/breed_details/domain/repositories/breed_details_repository.dart';
import 'package:cat_breeds_app/features/breeds_list/data/datasources/breeds_remote_data_source.dart';
import 'package:cat_breeds_app/features/breeds_list/data/models/breed_model.dart';

class BreedDetailsRepositoryImpl implements BreedDetailsRepository {
  final BreedsRemoteDataSource remoteDataSource;

  BreedDetailsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<String, BreedModel>> getBreedById(String id) async {
    try {
      // Obtener todas las razas y filtrar por ID
      final breeds = await remoteDataSource.getBreeds();
      final breed = breeds.firstWhere(
        (breed) => breed.id == id,
        orElse: () => throw Exception('Raza no encontrada'),
      );
      return Right(breed);
    } on ServerException catch (e) {
      return Left(e.message);
    } catch (e) {
      return Left('Error inesperado: $e');
    }
  }
}
