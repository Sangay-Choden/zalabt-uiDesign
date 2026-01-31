// import 'package:flutter/material.dart';
// import 'product_detail.dart';
// import '../widgets/bottom_nav.dart';

// class CategoryScreen extends StatefulWidget {
//   final String category;

//   const CategoryScreen({
//     super.key,
//     required this.category,
//   });

//   @override
//   State<CategoryScreen> createState() => _CategoryScreenState();
// }

// class _CategoryScreenState extends State<CategoryScreen> {
//   int _currentIndex = 2;

//   // 🔵 SINGLE PRODUCT SOURCE (USED BY ALL CATEGORIES)
//   static final List<Map<String, dynamic>> allProducts = [
//     {
//       "image": "assets/watch.jpg",
//       "name": "Smart Watch Series 8",
//       "category": "Electronics",
//       "type": "Wearables",
//       "stock": 8,
//       "price": "Nu. 4,200",
//       "store": "Bhutan Express",
//     },
//     {
//       "image": "assets/laptop.png",
//       "name": "Gaming Laptop",
//       "category": "Electronics",
//       "type": "Computers",
//       "stock": 5,
//       "price": "Nu. 85,000",
//       "store": "Bhutan Express",
//     },
//     {
//       "image": "assets/headphone.jpg",
//       "name": "Foldable Saw 18\" - SRPP18",
//       "category": "Tools",
//       "type": "Hardware",
//       "stock": 42,
//       "price": "Nu. 490.00",
//       "store": "Bhutan Express",
//     },
//     {
//       "image": "assets/headphone.jpg",
//       "name": "Wireless Headset Pro",
//       "category": "Accessories",
//       "type": "Audio",
//       "stock": 15,
//       "price": "Nu. 2,500",
//       "store": "Bhutan Express",
//     },
//   ];

//   List<Map<String, dynamic>> get categoryProducts {
//     return allProducts
//         .where((product) => product["category"] == widget.category)
//         .toList();
//   }

//   void _onBottomNavTap(int index) {
//     setState(() => _currentIndex = index);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,

//       // 🔵 APP BAR
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: const Color.fromARGB(255, 246, 235, 221),
//         centerTitle: true,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: Text(
//           widget.category,
//           style: const TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Colors.black,
//           ),
//         ),
//       ),

//       // 🔵 BODY
//       body: Padding(
//         padding: const EdgeInsets.all(14),
//         child: categoryProducts.isEmpty
//             ? const Center(
//                 child: Text(
//                   "No products available",
//                   style: TextStyle(color: Colors.grey),
//                 ),
//               )
//             : GridView.builder(
//                 itemCount: categoryProducts.length,
//                 gridDelegate:
//                     const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 14,
//                   mainAxisSpacing: 14,
//                   childAspectRatio: 0.65,
//                 ),
//                 itemBuilder: (context, index) {
//                   final product = categoryProducts[index];
//                   return GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (_) =>
//                               ProductDetailScreen(product: product),
//                         ),
//                       );
//                     },
//                     child: _productCard(product),
//                   );
//                 },
//               ),
//       ),

//       // 🔵 BOTTOM NAV
//       bottomNavigationBar: BottomNav(
//         currentIndex: _currentIndex,
//         onTap: _onBottomNavTap,
//       ),
//     );
//   }

//   // 🧾 PRODUCT CARD (SAME UI AS YOUR ALL PRODUCT PAGE)
//   Widget _productCard(Map<String, dynamic> product) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(14),
//         border: Border.all(color: const Color(0xFFE0E0E0)),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ClipRRect(
//             borderRadius:
//                 const BorderRadius.vertical(top: Radius.circular(14)),
//             child: Image.asset(
//               product["image"],
//               height: 100,
//               width: double.infinity,
//               fit: BoxFit.cover,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   product["name"],
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                   style: const TextStyle(
//                       fontSize: 13, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 6),
//                 Container(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
//                   decoration: BoxDecoration(
//                     color: const Color(0xFF7B95AC).withOpacity(0.15),
//                     borderRadius: BorderRadius.circular(6),
//                   ),
//                   child: Text(
//                     product["type"],
//                     style: const TextStyle(
//                       fontSize: 11,
//                       fontWeight: FontWeight.w600,
//                       color: Color(0xFF7B95AC),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   "Stock: ${product["stock"]}",
//                   style: const TextStyle(
//                     fontSize: 11,
//                     color: Color.fromARGB(255, 98, 125, 149),
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       product["price"],
//                       style: const TextStyle(
//                           fontSize: 14, fontWeight: FontWeight.bold),
//                     ),
//                     Container(
//                       padding: const EdgeInsets.all(6),
//                       decoration: BoxDecoration(
//                         color: product["stock"] > 0
//                             ? const Color(0xFF3A1212)
//                             : Colors.grey,
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: const Icon(
//                         Icons.shopping_cart_outlined,
//                         color: Colors.white,
//                         size: 18,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }





import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/bottom_nav.dart';

class CategoryScreen extends StatefulWidget {
  final String category;

  const CategoryScreen({super.key, required this.category});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int _currentIndex = 1;

  final List<Map<String, String>> allProducts = [
    {
      "image": "assets/watch.jpg",
      "title": "Smart Watch",
      "category": "Electronics",
      "price": "Nu. 4,200",
    },
    {
      "image": "assets/laptop.png",
      "title": "Gaming Laptop",
      "category": "Electronics",
      "price": "Nu. 85,000",
    },
    {
      "image": "assets/pet.jpg",
      "title": "Dog Food",
      "category": "Animals & Pets",
      "price": "Nu. 1,200",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final products = allProducts
        .where((p) => p["category"] == widget.category)
        .toList();

    return Scaffold(
      appBar: CustomAppBar(title: widget.category),
      body: GridView.builder(
        padding: const EdgeInsets.all(14),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 14,
          crossAxisSpacing: 14,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          return _ProductCard(product: products[index]);
        },
      ),
      bottomNavigationBar: BottomNav(
        currentIndex: _currentIndex,
        onTap: (i) {},
      ),
    );
  }
}

// ================= PRODUCT CARD =================

class _ProductCard extends StatelessWidget {
  final Map<String, String> product;
  const _ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.asset(product["image"]!, fit: BoxFit.cover),
          ),
          const SizedBox(height: 8),
          Text(product["title"]!,
              style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(product["price"]!,
              style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
