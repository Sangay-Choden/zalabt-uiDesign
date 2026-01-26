
// import 'package:flutter/material.dart';
// import '../widgets/custom_app_bar.dart';
// import '../widgets/bottom_nav.dart';
// import '../widgets/product_slider.dart';
// import '../widgets/category_row.dart';
// import 'allproduct.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int currentIndex = 0;

//   final topProducts = [
//     {"image": "assets/headphone1.png", "title": "Wireless Headset", "price": "Nu. 2,500"},
//     {"image": "assets/laptop1.png", "title": "Gaming Laptop", "price": "Nu. 85,000"},
//     {"image": "assets/watch1.png", "title": "Smart Watch", "price": "Nu. 4,200"},
//   ];

//   final bool hasPurchasedSales = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: const CustomAppBar(),

//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _search(),
//             const SizedBox(height: 20),

//             _header("Top Products"),
//             ProductSlider(products: topProducts),

//             const SizedBox(height: 24),

//             _header("Category"),
//             const CategoryRow(),

//             const SizedBox(height: 30),

//             _header(
//               "Products",
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (_) => const AllProductScreen()),
//                 );
//               },
//             ),
//             const SizedBox(height: 12),

//             SizedBox(
//               height: 260,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: 6,
//                 itemBuilder: (context, index) {
//                   return const _ProductCard();
//                 },
//               ),
//             ),

//             const SizedBox(height: 30),

//             _header("Purchased Sales"),
//             const SizedBox(height: 12),

//             hasPurchasedSales
//                 ? SizedBox(
//                     height: 260,
//                     child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: 3,
//                       itemBuilder: (context, index) {
//                         return const _PurchasedCard();
//                       },
//                     ),
//                   )
//                 : _emptyPurchaseState(),
//           ],
//         ),
//       ),

//       bottomNavigationBar: BottomNav(
//         currentIndex: 0,
//         onTap: (_) {},
//       ),
//     );
//   }

//   Widget _search() => Container(
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(14),
//           border: Border.all(color: Colors.grey.shade300),
//         ),
//         child: const TextField(
//           decoration: InputDecoration(
//             hintText: "Search",
//             border: InputBorder.none,
//             icon: Icon(Icons.search),
//           ),
//         ),
//       );

//   Widget _header(String title, {VoidCallback? onTap}) => Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             title,
//             style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
//           ),
//           if (onTap != null)
//             TextButton(
//               onPressed: onTap,
//               child: const Text("See all"),
//             ),
//         ],
//       );

//   Widget _emptyPurchaseState() => Container(
//         padding: const EdgeInsets.symmetric(vertical: 40),
//         alignment: Alignment.center,
//         child: Column(
//           children: const [
//             Icon(Icons.shopping_bag_outlined, size: 48, color: Colors.grey),
//             SizedBox(height: 12),
//             Text(
//               "No purchases yet",
//               style: TextStyle(fontSize: 14, color: Colors.grey),
//             ),
//           ],
//         ),
//       );
// }

// // ================= PRODUCT CARD =================

// class _ProductCard extends StatefulWidget {
//   const _ProductCard();

//   @override
//   State<_ProductCard> createState() => _ProductCardState();
// }

// class _ProductCardState extends State<_ProductCard> {
//   double scale = 1;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTapDown: (_) => setState(() => scale = 0.95),
//       onTapUp: (_) => setState(() => scale = 1),
//       onTapCancel: () => setState(() => scale = 1),
//       child: AnimatedScale(
//         scale: scale,
//         duration: const Duration(milliseconds: 150),
//         child: Container(
//           width: 173,
//           margin: const EdgeInsets.only(right: 14),
//           padding: const EdgeInsets.all(12),
//           decoration: BoxDecoration(
//             color: Colors.white, // ✅ white bg
//             borderRadius: BorderRadius.circular(16),
//             border: Border.all(color: Colors.grey.shade300), // ✅ light grey border
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.08),
//                 blurRadius: 8,
//                 offset: const Offset(0, 4),
//               ),
//             ],
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Expanded(
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(12),
//                   child: Image.asset(
//                     "assets/w1.jpg",
//                     fit: BoxFit.cover,
//                     width: double.infinity,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               const Text(
//                 "Dog Food Premium",
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 4),
//               const Text(
//                 "Pet Food",
//                 style: TextStyle(fontSize: 12, color: Colors.grey),
//               ),
//               const SizedBox(height: 6),
//               const Text(
//                 "Nu. 850",
//                 style: TextStyle(fontWeight: FontWeight.w600),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // ================= PURCHASED CARD =================

// class _PurchasedCard extends StatelessWidget {
//   const _PurchasedCard();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 173,
//       margin: const EdgeInsets.only(right: 14),
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.white, // ✅ white bg
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(color: Colors.grey.shade300), // ✅ light grey border
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.08),
//             blurRadius: 8,
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//             child: Stack(
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(12),
//                   child: Image.asset(
//                     "assets/headphone.jpg",
//                     fit: BoxFit.cover,
//                     width: double.infinity,
//                   ),
//                 ),
//                 Positioned(
//                   top: 8,
//                   left: 8,
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                     decoration: BoxDecoration(
//                       color: const Color( 0xFFB00020),
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: const Text(
//                       "SOLD OUT",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 11,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 10),
//           const Text(
//             "Dog Food Premium",
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 6),
//           const Text(
//             "Nu. 850",
//             style: TextStyle(
//               fontWeight: FontWeight.w600,
//               color: Colors.grey,
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
import '../widgets/product_slider.dart';
import '../widgets/category_row.dart';
import 'allproduct.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  // 🔹 Top products slider
  final topProducts = [
    {"image": "assets/headphone1.png", "title": "Wireless Headset", "price": "Nu. 2,500"},
    {"image": "assets/laptop1.png", "title": "Gaming Laptop", "price": "Nu. 85,000"},
    {"image": "assets/watch1.png", "title": "Smart Watch", "price": "Nu. 4,200"},
  ];

  // 🔹 Products list
  final products = [
    {
      "image": "assets/w1.jpg",
      "title": "Dog Food Premium",
      "category": "Pet Food",
      "price": "Nu. 850",
    },
    {
      "image": "assets/headphone.jpg",
      "title": "Cat Food",
      "category": "Pet Food",
      "price": "Nu. 780",
    },
    {
      "image": "assets/w1.jpg",
      "title": "Pet Shampoo",
      "category": "Accessories",
      "price": "Nu. 430",
    },
  ];

  // 🔹 Purchased products
  final purchasedProducts = [
    {
      "image": "assets/headphone.jpg",
      "title": "Wireless Headset",
      "price": "Nu. 2,500",
    },
    {
      "image": "assets/watch1.png",
      "title": "Smart Watch",
      "price": "Nu. 4,200",
    },
  ];

  final bool hasPurchasedSales = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _search(),
            const SizedBox(height: 20),

            _header("Top Products"),
            ProductSlider(products: topProducts),

            const SizedBox(height: 24),

            _header("Category"),
            const CategoryRow(),

            const SizedBox(height: 30),

            _header(
              "Products",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AllProductScreen()),
                );
              },
            ),
            const SizedBox(height: 12),

            SizedBox(
              height: 260,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return _ProductCard(product: products[index]);
                },
              ),
            ),

            const SizedBox(height: 30),

            _header("Purchased Sales"),
            const SizedBox(height: 12),

            hasPurchasedSales
                ? SizedBox(
                    height: 260,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: purchasedProducts.length,
                      itemBuilder: (context, index) {
                        return _PurchasedCard(product: purchasedProducts[index]);
                      },
                    ),
                  )
                : _emptyPurchaseState(),
          ],
        ),
      ),

      bottomNavigationBar: BottomNav(
        currentIndex: 0,
        onTap: (_) {},
      ),
    );
  }

  // ================= UI HELPERS =================

  Widget _search() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: const TextField(
          decoration: InputDecoration(
            hintText: "Search",
            border: InputBorder.none,
            icon: Icon(Icons.search),
          ),
        ),
      );

  Widget _header(String title, {VoidCallback? onTap}) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          if (onTap != null)
            TextButton(
              onPressed: onTap,
              child: const Text("See all"),
            ),
        ],
      );

  Widget _emptyPurchaseState() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          children: const [
            Icon(Icons.shopping_bag_outlined, size: 48, color: Colors.grey),
            SizedBox(height: 12),
            Text(
              "No purchases yet",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      );
}

// ================= PRODUCT CARD =================

class _ProductCard extends StatefulWidget {
  final Map<String, String> product;

  const _ProductCard({required this.product});

  @override
  State<_ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<_ProductCard> {
  double scale = 1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => scale = 0.95),
      onTapUp: (_) => setState(() => scale = 1),
      onTapCancel: () => setState(() => scale = 1),
      child: AnimatedScale(
        scale: scale,
        duration: const Duration(milliseconds: 150),
        child: Container(
          width: 173,
          margin: const EdgeInsets.only(right: 14),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade300),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.08),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    widget.product["image"]!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                widget.product["title"]!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                widget.product["category"]!,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(height: 6),
              Text(
                widget.product["price"]!,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ================= PURCHASED CARD =================

class _PurchasedCard extends StatelessWidget {
  final Map<String, String> product;

  const _PurchasedCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 173,
      margin: const EdgeInsets.only(right: 14),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    product["image"]!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFB00020),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      "SOLD OUT",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            product["title"]!,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Text(
            product["price"]!,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
