import 'package:flutter/material.dart';

class IntelligenceIndicator extends StatelessWidget {
  final int level;

  const IntelligenceIndicator({
    Key? key,
    required this.level,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Inteligencia: '),
        Row(
          children: List.generate(5, (index) {
            return Icon(
              Icons.star,
              size: 16,
              color: index < level ? Colors.amber : Colors.grey[300],
            );
          }),
        ),
      ],
    );
  }
}
