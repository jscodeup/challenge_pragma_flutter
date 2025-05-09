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
}
