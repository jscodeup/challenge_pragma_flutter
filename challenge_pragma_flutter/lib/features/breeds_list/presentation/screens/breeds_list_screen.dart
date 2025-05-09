import 'package:cat_breeds_app/config/routes.dart';
import 'package:cat_breeds_app/di/injection.dart';
import 'package:cat_breeds_app/features/breeds_list/presentation/viewmodels/breeds_list_viewmodel.dart';
import 'package:cat_breeds_app/features/breeds_list/presentation/widgets/breed_list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BreedsListScreen extends StatefulWidget {
  const BreedsListScreen({Key? key}) : super(key: key);

  @override
  State<BreedsListScreen> createState() => _BreedsListScreenState();
}

class _BreedsListScreenState extends State<BreedsListScreen> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BreedsListViewModel>(
      create: (_) => getIt<BreedsListViewModel>()..getBreeds(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Razas de Gatos'),
          actions: [
            IconButton(
              icon: const Icon(Icons.sort),
              onPressed: () => _showSortOptions(context),
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Buscar razas...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
              ),
            ),
            Expanded(
              child: Consumer<BreedsListViewModel>(
                builder: (context, viewModel, _) {
                  switch (viewModel.state) {
                    case ViewState.initial:
                    case ViewState.loading:
                      return const Center(child: CircularProgressIndicator());
                    case ViewState.error:
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Error: ${viewModel.errorMessage}',
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
                    case ViewState.loaded:
                      final filteredBreeds =
                          viewModel.filterBreedsByName(_searchQuery);
                      if (filteredBreeds.isEmpty) {
                        return const Center(
                          child: Text('No se encontraron razas'),
                        );
                      }
                      return RefreshIndicator(
                        onRefresh: () => viewModel.getBreeds(),
                        child: ListView.builder(
                          itemCount: filteredBreeds.length,
                          itemBuilder: (context, index) {
                            final breed = filteredBreeds[index];
                            return BreedListItem(
                              breed: breed,
                              onTap: () => Navigator.pushNamed(
                                context,
                                AppRoutes.breedDetails,
                                arguments: breed.id,
                              ),
                            );
                          },
                        ),
                      );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSortOptions(BuildContext context) {
    final viewModel = Provider.of<BreedsListViewModel>(context, listen: false);

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Ordenar por',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              ListTile(
                leading: const Icon(Icons.sort_by_alpha),
                title: const Text('Nombre'),
                onTap: () {
                  viewModel.sortBreeds(by: 'name');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.psychology),
                title: const Text('Inteligencia'),
                onTap: () {
                  viewModel.sortBreeds(by: 'intelligence', ascending: false);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.public),
                title: const Text('País de origen'),
                onTap: () {
                  viewModel.sortBreeds(by: 'origin');
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
