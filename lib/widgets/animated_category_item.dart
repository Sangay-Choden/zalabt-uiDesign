// TODO Implement this library.
import 'package:flutter/material.dart';

class AnimatedCategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const AnimatedCategoryItem({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 249, 244, 237),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 26),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: 70,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 11),
          ),
        ),
      ],
    );
  }
}
