import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final String title;
  final String? description;

  const Description(
      {super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style:
                const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10.0),
        Text(description ?? 'No description available.',
            style: TextStyle(fontSize: 14.0, color: Colors.grey[600])),
      ],
    );
  }
}
