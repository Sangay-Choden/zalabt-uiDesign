// import 'package:flutter/material.dart';

// class AnimatedCategoryItem extends StatelessWidget {
//   final IconData icon;
//   final String label;

//   const AnimatedCategoryItem({
//     super.key,
//     required this.icon,
//     required this.label,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           width: 60,
//           height: 60,
//           decoration: BoxDecoration(
//             color: const Color.fromARGB(255, 255, 255, 255),
//             shape: BoxShape.circle,
//           ),
//           child: Icon(icon, size: 24),
//         ),
//         const SizedBox(height: 1),
//         SizedBox(
//           width: 70,
//           child: Text(
//             label,
//             textAlign: TextAlign.center,
//             style: const TextStyle(fontSize: 11),
//           ),
//         ),
//       ],
//     );
//   }
// }




import 'package:flutter/material.dart';
import '../screens/category.dart';

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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CategoryScreen(category: label),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 24),
          ),
          const SizedBox(height: 6),
          SizedBox(
            width: 70,
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 11),
            ),
          ),
        ],
      ),
    );
  }
}
