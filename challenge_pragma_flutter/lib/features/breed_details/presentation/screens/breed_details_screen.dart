import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/breed_details_viewmodel.dart';
import '../widgets/attribute_rating.dart';
import '../../../../di/injection.dart';

class BreedDetailsScreen extends StatelessWidget {
  final String breedId;

  const BreedDetailsScreen({
    Key? key,
    required this.breedId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BreedDetailsViewModel>(
      create: (_) => getIt<BreedDetailsViewModel>()..getBreedById(breedId),
      child: Scaffold(
        body: Consumer<BreedDetailsViewModel>(
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
                        onPressed: () =>
                            viewModel.getBreedById(viewModel.breedId),
                        child: const Text('Reintentar'),
                      ),
                    ],
                  ),
                );
              case ViewState.loaded:
                final breed = viewModel.breed!;
                return CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      expandedHeight: 300,
                      pinned: true,
                      flexibleSpace: FlexibleSpaceBar(
                        title: Text(
                          breed.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                blurRadius: 10.0,
                                color: Colors.black,
                                offset: Offset(1.0, 1.0),
                              ),
                            ],
                          ),
                        ),
                        background: breed.imageUrl != null
                            ? Hero(
                                tag: 'breed_image_${breed.id}',
                                child: Image.network(
                                  breed.imageUrl!,
                                  fit: BoxFit.cover,
                                  errorBuilder: (_, __, ___) => Container(
                                    color: Colors.grey[300],
                                    child: const Icon(Icons.pets, size: 100),
                                  ),
                                ),
                              )
                            : Container(
                                color: Colors.grey[300],
                                child: const Icon(Icons.pets, size: 100),
                              ),
                      ),
                      actions: [
                        IconButton(
                          icon: const Icon(Icons.share),
                          onPressed: () => viewModel.shareBreed(),
                        ),
                        IconButton(
                          icon: const Icon(Icons.favorite_border),
                          onPressed: () => viewModel.toggleFavorite(),
                        ),
                      ],
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (breed.description != null) ...[
                              const Text(
                                'Descripción',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                breed.description!,
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 16),
                              const Divider(),
                            ],

                            const SizedBox(height: 16),
                            const Text(
                              'Información',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),

                            // Información básica
                            ListTile(
                              leading: const Icon(Icons.public),
                              title: Text('País de origen: ${breed.origin}'),
                              onTap: () => viewModel.searchByOrigin(),
                            ),

                            if (breed.lifeSpan != null)
                              ListTile(
                                leading: const Icon(Icons.access_time),
                                title: Text(
                                    'Esperanza de vida: ${breed.lifeSpan}'),
                              ),

                            if (breed.temperament != null)
                              ListTile(
                                leading: const Icon(Icons.psychology),
                                title:
                                    Text('Temperamento: ${breed.temperament}'),
                              ),

                            if (breed.wikipediaUrl != null)
                              ListTile(
                                leading: const Icon(Icons.link),
                                title: const Text('Ver en Wikipedia'),
                                onTap: () => viewModel.openWikipedia(),
                              ),

                            const SizedBox(height: 16),
                            const Divider(),
                            const SizedBox(height: 16),

                            // Atributos
                            const Text(
                              'Características',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),

                            AttributeRating(
                              title: 'Inteligencia',
                              rating: breed.intelligence,
                              icon: Icons.lightbulb,
                            ),

                            if (breed.adaptability != null)
                              AttributeRating(
                                title: 'Adaptabilidad',
                                rating: breed.adaptability!,
                                icon: Icons.home,
                              ),

                            if (breed.affectionLevel != null)
                              AttributeRating(
                                title: 'Afecto',
                                rating: breed.affectionLevel!,
                                icon: Icons.favorite,
                              ),

                            if (breed.childFriendly != null)
                              AttributeRating(
                                title: 'Amigable con niños',
                                rating: breed.childFriendly!,
                                icon: Icons.child_care,
                              ),

                            if (breed.dogFriendly != null)
                              AttributeRating(
                                title: 'Amigable con perros',
                                rating: breed.dogFriendly!,
                                icon: Icons.pets,
                              ),

                            if (breed.energyLevel != null)
                              AttributeRating(
                                title: 'Nivel de energía',
                                rating: breed.energyLevel!,
                                icon: Icons.bolt,
                              ),

                            if (breed.grooming != null)
                              AttributeRating(
                                title: 'Necesidad de aseo',
                                rating: breed.grooming!,
                                icon: Icons.brush,
                              ),

                            if (breed.healthIssues != null)
                              AttributeRating(
                                title: 'Problemas de salud',
                                rating: breed.healthIssues!,
                                icon: Icons.healing,
                              ),

                            if (breed.socialNeeds != null)
                              AttributeRating(
                                title: 'Necesidades sociales',
                                rating: breed.socialNeeds!,
                                icon: Icons.people,
                              ),

                            if (breed.strangerFriendly != null)
                              AttributeRating(
                                title: 'Amigable con extraños',
                                rating: breed.strangerFriendly!,
                                icon: Icons.person,
                              ),

                            const SizedBox(height: 32),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
            }
          },
        ),
      ),
    );
  }
}
