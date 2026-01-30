// import 'package:flutter/material.dart';
// import '../widgets/custom_app_bar.dart';
// import '../widgets/bottom_nav.dart';

// class StoreDetailScreen extends StatelessWidget {
//   final Map<String, String> store;

//   const StoreDetailScreen({super.key, required this.store});

//   @override
//   Widget build(BuildContext context) {
//     final products = [
//       {
//         "name": "HIKVISION DS-U02 1080p Webcam",
//         "image": "assets/webcam.webp",
//         "price": "Nu. 2,100",
//       },
//       {
//         "name": "Logitech C270 HD Webcam",
//         "image": "assets/webcam2.jpg",
//         "price": "Nu. 3,500",
//       },
//     ];

//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 255, 255, 255),
//  appBar: CustomAppBar(
//   title: store["name"]!,
//   leading: IconButton(
//     icon: const Icon(Icons.arrow_back, color: Colors.black),
//     onPressed: () {
//       Navigator.pop(context); // Back to Store screen
//     },
//   ),
// ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             /// ===== STORE HEADER =====
//             Container(
//               padding: const EdgeInsets.all(16),
//               color: Colors.white,
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(14),
//                     child: Image.asset(
//                       store["image"]!,
//                       height: 70,
//                       width: 70,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   const SizedBox(width: 14),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           store["name"]!,
//                           style: const TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                         const SizedBox(height: 4),
//                         const Text(
//                           "Electronics",
//                           style: TextStyle(
//                             fontSize: 13,
//                             color: Color(0xFF7B95AC),
//                           ),
//                         ),
//                         const SizedBox(height: 6),
//                         Text(
//                           "Thimphu Main Town near 8 Eleven",
//                           style: TextStyle(
//                             fontSize: 12,
//                             color: Colors.grey.shade600,
//                           ),
//                         ),
//                         const SizedBox(height: 4),
//                         Text(
//                           "Seller since: ${store["since"]}",
//                           style: TextStyle(
//                             fontSize: 12,
//                             color: Colors.grey.shade500,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 12),

//             /// ===== PRODUCT COUNT + SORT =====
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Products (${products.length})",
//                     style: const TextStyle(
//                       fontSize: 15,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   Container(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(20),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.06),
//                           blurRadius: 10,
//                         ),
//                       ],
//                     ),
//                     child: Row(
//                       children: const [
//                         Text(
//                           "Latest",
//                           style: TextStyle(fontSize: 13),
//                         ),
//                         Icon(Icons.keyboard_arrow_down, size: 18),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 12),

//             /// ===== PRODUCTS GRID =====
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: GridView.builder(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemCount: products.length,
//                 gridDelegate:
//                     const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 14,
//                   mainAxisSpacing: 14,
//                   childAspectRatio: 0.72,
//                 ),
//                 itemBuilder: (context, index) {
//                   final product = products[index];
//                   return _ProductCard(product: product);
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNav(
//         currentIndex: 1,
//         onTap: (_) {},
//       ),
//     );
//   }
// }

// /// ===== PRODUCT CARD =====
// class _ProductCard extends StatelessWidget {
//   final Map<String, String> product;

//   const _ProductCard({required this.product});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(18),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.08),
//             blurRadius: 12,
//             offset: const Offset(0, 6),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//             child: ClipRRect(
//               borderRadius:
//                   const BorderRadius.vertical(top: Radius.circular(18)),
//               child: Image.asset(
//                 product["image"]!,
//                 width: double.infinity,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   product["name"]!,
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                   style: const TextStyle(
//                     fontSize: 13,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 const SizedBox(height: 6),
//                 Text(
//                   product["price"]!,
//                   style: const TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xFF3A1212),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }





// import 'package:flutter/material.dart';
// import '../widgets/custom_app_bar.dart';
// import '../widgets/bottom_nav.dart';

// import '../screens/product_detail.dart'; // import your ProductDetailScreen

// class StoreDetailScreen extends StatelessWidget {
//   final Map<String, String> store;

//   const StoreDetailScreen({super.key, required this.store});

//   @override
//   Widget build(BuildContext context) {
//     final products = [
//       {
//         "name": "HIKVISION DS-U02 1080p Webcam",
//         "image": "assets/webcam.webp",
//         "price": "Nu. 2,100",
//         "category": "Electronics",
//         "type": "Webcam",
//       },
//       {
//         "name": "Logitech C270 HD Webcam",
//         "image": "assets/webcam2.jpg",
//         "price": "Nu. 3,500",
//         "category": "Electronics",
//         "type": "Webcam",
//       },
//     ];

//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 255, 255, 255),
//       appBar: CustomAppBar(
//         title: store["name"]!,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () {
//             Navigator.pop(context); // back to Store screen
//           },
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             /// ===== STORE HEADER =====
//             Container(
//               padding: const EdgeInsets.all(16),
//               color: Colors.white,
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(14),
//                     child: Image.asset(
//                       store["image"]!,
//                       height: 70,
//                       width: 70,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   const SizedBox(width: 14),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           store["name"]!,
//                           style: const TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const SizedBox(height: 4),
//                         const Text(
//                           "Electronics",
//                           style: TextStyle(
//                             fontSize: 13,
//                             color: Color(0xFF7B95AC),
//                           ),
//                         ),
//                         const SizedBox(height: 6),
//                         Text(
//                           "Thimphu Main Town near 8 Eleven",
//                           style: TextStyle(
//                             fontSize: 12,
//                             color: Colors.grey.shade600,
//                           ),
//                         ),
//                         const SizedBox(height: 4),
//                         Text(
//                           "Seller since: ${store["since"]}",
//                           style: TextStyle(
//                             fontSize: 12,
//                             color: Colors.grey.shade500,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 16),

//             /// ===== PRODUCT COUNT =====
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Text(
//                 "Products (${products.length})",
//                 style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 12),

//             /// ===== PRODUCTS GRID =====
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: GridView.builder(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemCount: products.length,
//                 gridDelegate:
//                     const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 14,
//                   mainAxisSpacing: 14,
//                   childAspectRatio: 0.68,
//                 ),
//                 itemBuilder: (context, index) {
//                   final product = products[index];
//                   return _ProductCard(product: product);
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNav(
//         currentIndex: 1,
//         onTap: (_) {},
//       ),
//     );
//   }
// }

// /// ===== PRODUCT CARD =====
// class _ProductCard extends StatelessWidget {
//   final Map<String, dynamic> product;

//   const _ProductCard({required this.product});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         // Navigate to ProductDetailScreen with full details
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (_) => ProductDetailScreen(product: product),
//           ),
//         );
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(18),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.08),
//               blurRadius: 12,
//               offset: const Offset(0, 6),
//             ),
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               child: ClipRRect(
//                 borderRadius:
//                     const BorderRadius.vertical(top: Radius.circular(18)),
//                 child: Image.asset(
//                   product["image"]!,
//                   width: double.infinity,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     product["name"]!,
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                     style: const TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   const SizedBox(height: 6),
//                   Text(
//                     product["price"]!,
//                     style: const TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold,
//                       color: Color(0xFF3A1212),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/bottom_nav.dart';
import '../screens/product_detail.dart';
import '../screens/cart.dart';
import 'wishlist.dart'; // create a WishlistScreen

class StoreDetailScreen extends StatelessWidget {
  final Map<String, String> store;

  const StoreDetailScreen({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    final products = [
      {
        "name": "HIKVISION DS-U02 1080p Webcam",
        "image": "assets/webcam.webp",
        "price": "Nu. 2,100",
        "category": "Electronics",
        "type": "Webcam",
      },
      {
        "name": "Logitech C270 HD Webcam",
        "image": "assets/webcam2.jpg",
        "price": "Nu. 3,500",
        "category": "Electronics",
        "type": "Webcam",
      },
    ];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: CustomAppBar(
        title: store["name"]!,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // back to Store screen
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ===== STORE HEADER =====
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.asset(
                      store["image"]!,
                      height: 70,
                      width: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          store["name"]!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          "Electronics",
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF7B95AC),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "Thimphu Main Town near 8 Eleven",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Seller since: ${store["since"]}",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            /// ===== PRODUCT COUNT =====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Products (${products.length})",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 12),

            /// ===== PRODUCTS GRID =====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: products.length,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: 0.68,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return _ProductCard(product: product);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(
        currentIndex: 1,
        onTap: (_) {},
      ),
    );
  }
}

/// ===== PRODUCT CARD =====
class _ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;

  const _ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to ProductDetailScreen with full details
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailScreen(product: product),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(18)),
                    child: Image.asset(
                      product["image"]!,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product["name"]!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        product["price"]!,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3A1212),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              // Navigate to Wishlist screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => WishlistScreen(product: product),
                                ),
                              );
                            },
                            child: const Icon(
                              Icons.favorite_border,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
