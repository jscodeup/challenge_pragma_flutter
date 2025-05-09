import 'package:cat_breeds_app/config/constants.dart';
import 'package:cat_breeds_app/core/error/exceptions.dart';
import 'package:cat_breeds_app/core/network/api_client.dart';
import 'package:cat_breeds_app/features/breeds_list/data/models/breed_model.dart';

abstract class BreedsRemoteDataSource {
  Future<List<BreedModel>> getBreeds();
}

class BreedsRemoteDataSourceImpl implements BreedsRemoteDataSource {
  final ApiClient apiClient;

  BreedsRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<List<BreedModel>> getBreeds() async {
    try {
      final jsonData = await apiClient.get(ApiConstants.breedsEndpoint);
      return (jsonData as List)
          .map((breedJson) => BreedModel.fromJson(breedJson))
          .toList();
    } catch (e) {
      throw ServerException(
        message: 'Error obteniendo razas: $e',
        statusCode: 500,
      );
    }
  }
}
