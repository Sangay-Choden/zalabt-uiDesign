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

//   // 🔹 Top products slider
//   final topProducts = [
//     {"image": "assets/headphone1.png", "title": "Wireless Headset", "price": "Nu. 2,500"},
//     {"image": "assets/laptop1.png", "title": "Gaming Laptop", "price": "Nu. 85,000"},
//     {"image": "assets/watch1.png", "title": "Smart Watch", "price": "Nu. 4,200"},
//   ];

//   // 🔹 Products list
//   final products = [
//     {
//       "image": "assets/w1.jpg",
//       "title": "Dog Food Premium",
//       "category": "Pet Food",
//       "price": "Nu. 850",
//     },
//     {
//       "image": "assets/headphone.jpg",
//       "title": "Cat Food",
//       "category": "Pet Food",
//       "price": "Nu. 780",
//     },
//     {
//       "image": "assets/w1.jpg",
//       "title": "Pet Shampoo",
//       "category": "Accessories",
//       "price": "Nu. 430",
//     },
//   ];

//   // 🔹 Purchased products
//   final purchasedProducts = [
//     {
//       "image": "assets/headphone.jpg",
//       "title": "Wireless Headset",
//       "price": "Nu. 2,500",
//     },
//     {
//       "image": "assets/watch1.png",
//       "title": "Smart Watch",
//       "price": "Nu. 4,200",
//     },
//   ];

//   final bool hasPurchasedSales = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF7F8FA),
//       appBar: const CustomAppBar(),

//       body: SingleChildScrollView(
//         physics: const BouncingScrollPhysics(),
//         padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _search(),
//             const SizedBox(height: 22),

//             _header("Top Products"),
//             const SizedBox(height: 12),
//             ProductSlider(products: topProducts),

//             const SizedBox(height: 28),

//             _header("Categories"),
//             const SizedBox(height: 12),
//             const CategoryRow(),

//             const SizedBox(height: 32),

//             _header(
//               "Products",
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (_) => const AllProductScreen()),
//                 );
//               },
//             ),

//             const SizedBox(height: 14),

//             SizedBox(
//               height: 260,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 physics: const BouncingScrollPhysics(),
//                 itemCount: products.length,
//                 itemBuilder: (context, index) {
//                   return _ProductCard(product: products[index]);
//                 },
//               ),
//             ),

//             const SizedBox(height: 34),

//             _header("Purchased Sales"),
//             const SizedBox(height: 14),

//             hasPurchasedSales
//                 ? SizedBox(
//                     height: 260,
//                     child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       physics: const BouncingScrollPhysics(),
//                       itemCount: purchasedProducts.length,
//                       itemBuilder: (context, index) {
//                         return _PurchasedCard(product: purchasedProducts[index]);
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

//   // ================= MODERN SEARCH BAR =================

//   Widget _search() => Container(
//         padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(18),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.04),
//               blurRadius: 12,
//               offset: const Offset(0, 6),
//             ),
//           ],
//         ),
//         child: Row(
//           children: [
//             const Icon(Icons.search, color: Colors.grey),
//             const SizedBox(width: 10),
//             const Expanded(
//               child: TextField(
//                 decoration: InputDecoration(
//                   hintText: "What are you looking for?",
//                   border: InputBorder.none,
//                 ),
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 color: const Color(0xFFF1F3F6),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: const Icon(Icons.tune, size: 18),
//             ),
//           ],
//         ),
//       );

//   // ================= MODERN SECTION HEADER =================

//   Widget _header(String title, {VoidCallback? onTap}) => Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 2),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               title,
//               style: const TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w700,
//                 letterSpacing: 0.2,
//               ),
//             ),
//             if (onTap != null)
//               GestureDetector(
//                 onTap: onTap,
//                 child: Row(
//                   children: const [
//                     Text(
//                       "See all",
//                       style: TextStyle(
//                         color: Color(0xFF6DBE45),
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     SizedBox(width: 4),
//                     Icon(
//                       Icons.arrow_forward_ios,
//                       size: 12,
//                       color: Color(0xFF6DBE45),
//                     ),
//                   ],
//                 ),
//               ),
//           ],
//         ),
//       );

//   Widget _emptyPurchaseState() => Padding(
//         padding: const EdgeInsets.symmetric(vertical: 40),
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

// // ================= PRODUCT CARD (UNCHANGED) =================

// class _ProductCard extends StatefulWidget {
//   final Map<String, String> product;

//   const _ProductCard({required this.product});

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
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(16),
//             border: Border.all(color: Colors.grey.shade300),
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
//                     widget.product["image"]!,
//                     fit: BoxFit.cover,
//                     width: double.infinity,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Text(
//                 widget.product["title"]!,
//                 style: const TextStyle(fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 4),
//               Text(
//                 widget.product["category"]!,
//                 style: const TextStyle(fontSize: 12, color: Colors.grey),
//               ),
//               const SizedBox(height: 6),
//               Text(
//                 widget.product["price"]!,
//                 style: const TextStyle(fontWeight: FontWeight.w600),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // ================= PURCHASED CARD (UNCHANGED) =================

// class _PurchasedCard extends StatelessWidget {
//   final Map<String, String> product;

//   const _PurchasedCard({required this.product});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 173,
//       margin: const EdgeInsets.only(right: 14),
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(color: Colors.grey.shade300),
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
//                     product["image"]!,
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
//                       color: const Color(0xFFB00020),
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
//           Text(
//             product["title"]!,
//             style: const TextStyle(fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 6),
//           Text(
//             product["price"]!,
//             style: const TextStyle(
//               fontWeight: FontWeight.w600,
//               color: Colors.grey,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }





// import 'package:flutter/material.dart';
// import '../widgets/bottom_nav.dart';
// import '../widgets/category_row.dart';
// import 'allproduct.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final ScrollController _scrollController = ScrollController();
//   bool showAppBar = false;

//   /// 🔹 TOP PRODUCTS SLIDER (USED AS HERO BG)
//   final topProducts = [
//     {"image": "assets/headphone1.png", "title": "Wireless Headset", "price": "Nu. 2,500"},
//     {"image": "assets/laptop1.png", "title": "Gaming Laptop", "price": "Nu. 85,000"},
//     {"image": "assets/watch1.png", "title": "Smart Watch", "price": "Nu. 4,200"},
//   ];

//   final products = [
//     {
//       "image": "assets/w1.jpg",
//       "title": "Dog Food Premium",
//       "category": "Pet Food",
//       "price": "Nu. 850",
//     },
//     {
//       "image": "assets/headphone.jpg",
//       "title": "Cat Food",
//       "category": "Pet Food",
//       "price": "Nu. 780",
//     },
//     {
//       "image": "assets/headphone.jpg",
//       "title": "Cat Food",
//       "category": "Pet Food",
//       "price": "Nu. 780",
//     },
//     {
//       "image": "assets/headphone.jpg",
//       "title": "Cat Food",
//       "category": "Pet Food",
//       "price": "Nu. 780",
//     },
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _scrollController.addListener(() {
//       if (_scrollController.offset > 240 && !showAppBar) {
//         setState(() => showAppBar = true);
//       } else if (_scrollController.offset <= 240 && showAppBar) {
//         setState(() => showAppBar = false);
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF6F6F6),

//       body: Stack(
//         children: [
//           /// ================= FIXED HERO BG =================
//           _heroBackground(),

//           /// ================= CONTENT =================
//           SingleChildScrollView(
//             controller: _scrollController,
//             physics: const BouncingScrollPhysics(),
//             padding: const EdgeInsets.only(top: 335),
//             child: Column(
//               children: [
//                 /// ===== INSET WHITE CARD =====
//                 Container(
//                   padding: const EdgeInsets.fromLTRB(16, 28, 16, 24),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: const BorderRadius.vertical(
//                       top: Radius.circular(32),
//                     ),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.08),
//                         blurRadius: 20,
//                         offset: const Offset(0, -6),
//                       ),
//                     ],
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         "Categories",
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                       const SizedBox(height: 14),

//                       const CategoryRow(),

//                       const SizedBox(height: 28),

//                       _header(
//                         "Products",
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (_) => const AllProductScreen(),
//                             ),
//                           );
//                         },
//                       ),

//                       const SizedBox(height: 14),

//                       GridView.builder(
//                         shrinkWrap: true,
//                         physics: const NeverScrollableScrollPhysics(),
//                         itemCount: products.length,
//                         gridDelegate:
//                             const SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 2,
//                           mainAxisSpacing: 14,
//                           crossAxisSpacing: 14,
//                           childAspectRatio: 0.72,
//                         ),
//                         itemBuilder: (context, index) {
//                           return _ProductCard(product: products[index]);
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           /// ================= SCROLL APP BAR =================
//           AnimatedPositioned(
//             duration: const Duration(milliseconds: 250),
//             top: showAppBar ? 0 : -100,
//             left: 0,
//             right: 0,
//             child: _scrollAppBar(),
//           ),
//         ],
//       ),

//       bottomNavigationBar: BottomNav(
//         currentIndex: 0,
//         onTap: (_) {},
//       ),
//     );
//   }

//   // ================= HERO BACKGROUND =================

//   Widget _heroBackground() {
//     return SizedBox(
//       height: 360,
//       width: double.infinity,
//       child: Stack(
//         children: [
//           /// Slider
//           PageView.builder(
//             itemCount: topProducts.length,
//             itemBuilder: (context, index) {
//               return _HeroProduct(
//                 image: topProducts[index]["image"]!,
//               );
//             },
//           ),

//               /// Text overlay
//           Positioned(
//             left: 20,
//             bottom: 150,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: const [
//                 // SizedBox(height: 9),
//                 Text(
//                   "Zala.bt",
//                   style: TextStyle(
//                     color: Color.fromARGB(255, 255, 255, 255),
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height:125),
//               ],
//             ),
//           ),

//           /// Text overlay
//           Positioned(
//             left: 20,
//             bottom: 90,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: const [
//                 Text("Spring Collection", style: TextStyle(color: Colors.white70)),
//                 SizedBox(height: 6),
//                 Text(
//                   "20% OFF",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 25,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 4),
//                 Text("For Selected Styles", style: TextStyle(color: Colors.white70)),
//               ],
//             ),
//           ),

   
//         ],
//       ),
//     );
//   }

//   // ================= SCROLL APP BAR =================

//   Widget _scrollAppBar() {
//     return Container(
//       height: 100,
//       padding: const EdgeInsets.fromLTRB(16, 42, 16, 12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.08),
//             blurRadius: 12,
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: const [
//           Icon(Icons.menu),
//           Text("Zala.bt", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
//           Icon(Icons.shopping_bag_outlined),
//         ],
//       ),
//     );
//   }

//   Widget _header(String title, {VoidCallback? onTap}) => Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(title,
//               style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
//           if (onTap != null)
//             GestureDetector(
//               onTap: onTap,
//               child: const Text("See all",
//                   style: TextStyle(color: Color(0xFF6DBE45))),
//             ),
//         ],
//       );
// }

// // ================= HERO PRODUCT SLIDE =================

// class _HeroProduct extends StatelessWidget {
//   final String image;
//   const _HeroProduct({required this.image});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.bottomCenter,
//           end: Alignment.topCenter,
//           colors: [
//             Colors.black.withOpacity(0.45),
//             Colors.transparent,
//           ],
//         ),
//       ),
//       child: Center(
//         child: Image.asset(
//           image,
//           height: 220,
//           fit: BoxFit.contain,
//         ),
//       ),
//     );
//   }
// }

// // ================= PRODUCT CARD =================

// class _ProductCard extends StatelessWidget {
//   final Map<String, String> product;
//   const _ProductCard({required this.product});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(18),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.06),
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
//               borderRadius: BorderRadius.circular(14),
//               child: Image.asset(
//                 product["image"]!,
//                 fit: BoxFit.cover,
//                 width: double.infinity,
//               ),
//             ),
//           ),
//           const SizedBox(height: 10),
//           Text(product["title"]!,
//               style: const TextStyle(fontWeight: FontWeight.bold)),
//           const SizedBox(height: 4),
//           Text(product["category"]!,
//               style: const TextStyle(fontSize: 12, color: Colors.grey)),
//           const SizedBox(height: 6),
//           Text(product["price"]!,
//               style: const TextStyle(fontWeight: FontWeight.w600)),
//         ],
//       ),
//     );
//   }
// }







import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/category_row.dart';
import 'allproduct.dart';
import 'cart.dart';
import '../widgets/hammenu.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final PageController _pageController = PageController(viewportFraction: 1);
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool showAppBar = false;
  int _currentSlide = 0;
  Timer? _autoSlideTimer;

  /// 🔹 TOP PRODUCTS SLIDER
  final topProducts = [
    {"image": "assets/bg3.jpg", "title": "Wireless Headset", "price": "Nu. 2,500"},
    // {"image": "assets/bg2.jpg", "title": "Gaming Laptop", "price": "Nu. 85,000"},
    // {"image": "assets/watch1.png", "title": "Smart Watch", "price": "Nu. 4,200"},
  ];

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
      "image": "assets/headphone.jpg",
      "title": "Cat Food",
      "category": "Pet Food",
      "price": "Nu. 780",
    },
    {
      "image": "assets/headphone.jpg",
      "title": "Cat Food",
      "category": "Pet Food",
      "price": "Nu. 780",
    },
  ];

  @override
  void initState() {
    super.initState();

    /// Scroll app bar trigger
    _scrollController.addListener(() {
      if (_scrollController.offset > 240 && !showAppBar) {
        setState(() => showAppBar = true);
      } else if (_scrollController.offset <= 240 && showAppBar) {
        setState(() => showAppBar = false);
      }
    });

    /// 🔁 Auto slide every 3 seconds
    _autoSlideTimer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (_pageController.hasClients) {
        _currentSlide = (_currentSlide + 1) % topProducts.length;
        _pageController.animateToPage(
          _currentSlide,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _autoSlideTimer?.cancel();
    _pageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       key: _scaffoldKey,
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      drawer: const HamMenu(),
      body: Stack(
        children: [
          /// ================= FIXED HERO BG =================
          _heroBackground(),

          /// ================= CONTENT =================
          SingleChildScrollView(
            controller: _scrollController,
            padding: const EdgeInsets.only(top: 335),
            physics: const BouncingScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 28, 16, 24),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Categories",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 14),
                  const CategoryRow(),
                  const SizedBox(height: 28),
                  _header(
                    "Top Products",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const AllProductScreen()),
                      );
                    },
                  ),
                  const SizedBox(height: 14),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 14,
                      crossAxisSpacing: 14,
                      childAspectRatio: 0.72,
                    ),
                    itemBuilder: (_, i) => _ProductCard(product: products[i]),
                  ),
                ],
              ),
            ),
          ),

          /// ================= SCROLL APP BAR =================
          AnimatedPositioned(
            duration: const Duration(milliseconds: 250),
            top: showAppBar ? 0 : -110,
            left: 0,
            right: 0,
            child: _scrollAppBar(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNav(currentIndex: 0, onTap: (_) {}),
    );
  }

  // ================= HERO BACKGROUND =================

  Widget _heroBackground() {
    return SizedBox(
      height: 360,
      child: Stack(
        children: [
          /// 🔁 PARALLAX SLIDER
          PageView.builder(
            controller: _pageController,
            itemCount: topProducts.length,
            onPageChanged: (i) => setState(() => _currentSlide = i),
            itemBuilder: (context, index) {
              return AnimatedBuilder(
                animation: _pageController,
                builder: (context, child) {
                  double offset = 0;
                  if (_pageController.position.haveDimensions) {
                    offset = (_pageController.page ?? 0) - index;
                  }
                  return Transform.translate(
                    offset: Offset(offset * 40, 0), // 🧲 parallax
                    child: child,
                  );
                },
                child: _HeroProduct(image: topProducts[index]["image"]!),
              );
            },
          ),

          /// TOP BAR (LOGO + CART)
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Zala.bt",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                 IconButton(
                  icon: const Icon(Icons.shopping_bag_outlined, color: Colors.white),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const CartScreen()),
                    );
                  },
                ),
              ],
            ),
          ),

          /// ✨ GLASSMORPHISM PROMO CARD
  /// Text overlay
          Positioned(
            left: 20,
            bottom: 90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Spring Collection", style: TextStyle(color: Colors.white70)),
                SizedBox(height: 6),
                Text(
                  "20% OFF",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text("For Selected Styles", style: TextStyle(color: Colors.white70)),
              ],
            ),
          ),

   
        // ],
//       ),
//     );

          /// SLIDER DOTS (LEFT)
          Positioned(
            left: 20,
            bottom: 40,
            child: Row(
              children: List.generate(
                topProducts.length,
                (i) => AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.only(right: 6),
                  width: _currentSlide == i ? 14 : 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: _currentSlide == i
                        ? Colors.white
                        : Colors.white38,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ================= SCROLL APP BAR =================

  Widget _scrollAppBar() {
    return Container(
      height: 100,
      padding: const EdgeInsets.fromLTRB(16, 42, 16, 12),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 246, 235, 221),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 12),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
          // ✅ FIXED HAMBURGER MENU
          GestureDetector(
            onTap: () => _scaffoldKey.currentState?.openDrawer(),
            child: const Icon(Icons.menu),
          ),


          const Text("Zala.bt",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CartScreen()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _header(String title, {VoidCallback? onTap}) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
          if (onTap != null)
            GestureDetector(
              onTap: onTap,
              child: const Text(
                "See all",
                style: TextStyle(color: Color.fromARGB(255, 51, 51, 51)),
              ),
            ),
        ],
      );
}

// ================= HERO PRODUCT =================

class _HeroProduct extends StatelessWidget {
  final String image;
  const _HeroProduct({required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Colors.black.withOpacity(0.45),
            Colors.transparent,
          ],
        ),
      ),
      child: Center(
        child: Image.asset(
            image,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover, // fills hero height
          ),

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
              offset: const Offset(0, 6)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.asset(
                product["image"]!,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(product["title"]!,
              style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(product["category"]!,
              style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 6),
          Text(product["price"]!,
              style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
