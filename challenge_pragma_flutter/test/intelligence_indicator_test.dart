import 'package:cat_breeds_app/features/breeds_list/presentation/widgets/intelligence_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
      'IntelligenceIndicator muestra correctamente el nivel de inteligencia',
      (WidgetTester tester) async {
    // Arrange
    const nivel = 3;

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: IntelligenceIndicator(level: nivel),
        ),
      ),
    );

    // Assert
    expect(find.byType(Icon), findsNWidgets(5));
  });

  testWidgets('IntelligenceIndicator muestra correctamente el nivel máximo',
      (WidgetTester tester) async {
    // Arrange
    const nivelMaximo = 5;

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: IntelligenceIndicator(level: nivelMaximo),
        ),
      ),
    );

    // Assert
    expect(find.byType(Icon), findsNWidgets(5));
  });
}
