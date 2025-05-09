import 'package:cat_breeds_app/features/breeds_list/data/models/breed_model.dart';
import 'package:cat_breeds_app/features/breeds_list/presentation/widgets/breed_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('BreedListItem muestra información correcta y maneja taps',
      (WidgetTester tester) async {
    // Arrange
    final breed = BreedModel(
      id: 'abys',
      name: 'Abisinio',
      origin: 'Egipto',
      intelligence: 4,
      imageUrl: 'https://ejemplo.com/imagen.jpg',
    );

    bool wasTapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BreedListItem(
            breed: breed,
            onTap: () => wasTapped = true,
          ),
        ),
      ),
    );

    // Assert
    expect(find.text('Abisinio'), findsOneWidget);
    expect(find.text('Origen: Egipto'), findsOneWidget);

    // Act
    await tester.tap(find.byType(Card));

    // Assert
    expect(wasTapped, true);
  });
}
