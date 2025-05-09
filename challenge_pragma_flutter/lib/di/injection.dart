import 'package:cat_breeds_app/features/breed_details/data/repositories/breed_details_repository_impl.dart';
import 'package:cat_breeds_app/features/breed_details/domain/repositories/breed_details_repository.dart';
import 'package:cat_breeds_app/features/breed_details/presentation/viewmodels/breed_details_viewmodel.dart';
import 'package:cat_breeds_app/features/breeds_list/presentation/viewmodels/breeds_list_viewmodel.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:cat_breeds_app/core/network/api_client.dart';
import 'package:cat_breeds_app/features/breeds_list/data/datasources/breeds_remote_data_source.dart';
import 'package:cat_breeds_app/features/breeds_list/data/repositories/breeds_repository_impl.dart';
import 'package:cat_breeds_app/features/breeds_list/domain/repositories/breeds_repository.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  // Core
  getIt.registerLazySingleton(() => http.Client());
  getIt.registerLazySingleton(() => ApiClient(httpClient: getIt()));

  // Breeds List Feature
  getIt.registerLazySingleton<BreedsRemoteDataSource>(
    () => BreedsRemoteDataSourceImpl(apiClient: getIt()),
  );
  getIt.registerLazySingleton<BreedsRepository>(
    () => BreedsRepositoryImpl(remoteDataSource: getIt()),
  );
  getIt.registerFactory(
    () => BreedsListViewModel(repository: getIt()),
  );

  // Breed Details Feature
  getIt.registerLazySingleton<BreedDetailsRepository>(
    () => BreedDetailsRepositoryImpl(remoteDataSource: getIt()),
  );
  getIt.registerFactory(
    () => BreedDetailsViewModel(repository: getIt()),
  );
}
