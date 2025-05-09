import 'package:cat_breeds_app/di/injection.dart';
import 'package:cat_breeds_app/features/breeds_list/presentation/viewmodels/breeds_list_viewmodel.dart';
import 'package:cat_breeds_app/features/breeds_list/presentation/widgets/breed_list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BreedsListScreen extends StatelessWidget {
  const BreedsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BreedsListViewModel>(
      create: (_) => BreedsListViewModel(repository: getIt())..getBreeds(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Razas de Gatos'),
        ),
        body: Consumer<BreedsListViewModel>(
          builder: (context, viewModel, _) {
            if (viewModel.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (viewModel.error != null) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Error: ${viewModel.error}',
                      style: const TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => viewModel.getBreeds(),
                      child: const Text('Reintentar'),
                    ),
                  ],
                ),
              );
            } else if (viewModel.breeds.isEmpty) {
              return const Center(
                child: Text('No se encontraron razas'),
              );
            } else {
              return ListView.builder(
                itemCount: viewModel.breeds.length,
                itemBuilder: (context, index) {
                  final breed = viewModel.breeds[index];
                  return BreedListItem(
                    breed: breed,
                    onTap: () {
                      // Navegación implementada más adelante
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
