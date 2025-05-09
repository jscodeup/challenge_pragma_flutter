import 'package:flutter/material.dart';

class AttributeRating extends StatelessWidget {
  final String title;
  final int rating;
  final int maxRating;
  final IconData icon;

  const AttributeRating({
    Key? key,
    required this.title,
    required this.rating,
    this.maxRating = 5,
    this.icon = Icons.star,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              '$title:',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: List.generate(maxRating, (index) {
                return Icon(
                  icon,
                  size: 18,
                  color: index < rating ? Colors.amber : Colors.grey[300],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
