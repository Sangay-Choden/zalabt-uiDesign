// import 'package:flutter/material.dart';
// import 'animated_category_item.dart';

// class CategoryRow extends StatelessWidget {
//   const CategoryRow({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 110,
//       child: ListView(
//         scrollDirection: Axis.horizontal,
//         children: const [
//           SizedBox(width: 12),
//           AnimatedCategoryItem(icon: Icons.pets, label: "Animals & Pets"),
//           SizedBox(width: 20),
//           AnimatedCategoryItem(icon: Icons.checkroom, label: "Apparel"),
//           SizedBox(width: 20),
//           AnimatedCategoryItem(icon: Icons.palette, label: "Arts & Entermt"),
//           SizedBox(width: 20),
//           AnimatedCategoryItem(icon: Icons.child_care, label: "Baby & Toddler"),
//           SizedBox(width: 20),
//           AnimatedCategoryItem(icon: Icons.devices, label: "Electronics"),
//           SizedBox(width: 20),
//           AnimatedCategoryItem(icon: Icons.fastfood, label: "Food & Beverages"),
//           SizedBox(width: 12),
//         ],
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'animated_category_item.dart';

class CategoryRow extends StatelessWidget {
  const CategoryRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          SizedBox(width: 12),
          AnimatedCategoryItem(icon: Icons.pets, label: "Animals & Pets"),
          SizedBox(width: 20),
          AnimatedCategoryItem(icon: Icons.checkroom, label: "Apparel"),
          SizedBox(width: 20),
          AnimatedCategoryItem(icon: Icons.palette, label: "Arts & Entermt"),
          SizedBox(width: 20),
          AnimatedCategoryItem(icon: Icons.child_care, label: "Baby & Toddler"),
          SizedBox(width: 20),
          AnimatedCategoryItem(icon: Icons.devices, label: "Electronics"),
          SizedBox(width: 20),
          AnimatedCategoryItem(icon: Icons.fastfood, label: "Food & Beverages"),
          SizedBox(width: 12),
        ],
      ),
    );
  }
}
