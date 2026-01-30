
// import 'package:flutter/material.dart';
// import 'cart.dart';

// class ProductDetailScreen extends StatefulWidget {
//   final Map<String, dynamic> product;

//   const ProductDetailScreen({
//     super.key,
//     required this.product,
//   });

//   @override
//   State<ProductDetailScreen> createState() => _ProductDetailScreenState();
// }

// class _ProductDetailScreenState extends State<ProductDetailScreen> {
//   int quantity = 1;

//   final List<Map<String, String>> reviews = [
//     {
//       "name": "Sonam",
//       "comment": "Great quality, looks premium!",
//       "rating": "5"
//     },
//     {
//       "name": "Tashi",
//       "comment": "Value for money. Delivery was fast.",
//       "rating": "4"
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final String image = widget.product["image"];
//     final String name = widget.product["name"];
//     final String category = widget.product["category"];
//     final String type = widget.product["type"];
//     final String price = widget.product["price"];

//     return Scaffold(
//       backgroundColor: const Color(0xFFF9F9F9),

//       // 🔹 APP BAR
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: const Text(
//           "Product Details",
//           style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
//         ),
//         centerTitle: true,
//         actions: const [
//           Padding(
//             padding: EdgeInsets.only(right: 12),
//             child: Icon(Icons.favorite_border, color: Colors.black),
//           )
//         ],
//       ),

//       body: Column(
//         children: [
//           Expanded(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [

//                   // 🔹 IMAGE CARD
//                   Container(
//                     height: 300,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(20),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.06),
//                           blurRadius: 15,
//                         )
//                       ],
//                     ),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(20),
//                       child: Image.asset(image, fit: BoxFit.cover),
//                     ),
//                   ),

//                   const SizedBox(height: 20),

//                   // 🔹 PRODUCT NAME
//                   Text(
//                     name,
//                     style: const TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),

//                   const SizedBox(height: 6),

//                   // 🔹 TYPE + CATEGORY
//                   Row(
//                     children: [
//                       _tag(type),
//                       const SizedBox(width: 8),
//                       Text(category,
//                           style: const TextStyle(color: Colors.grey)),
//                     ],
//                   ),

//                   const SizedBox(height: 12),

//                   // 🔹 STORE + STOCK
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text(
//                         "Sold by ZALABT Store",
//                         style: TextStyle(
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 10, vertical: 4),
//                         decoration: BoxDecoration(
//                           color: Colors.green.withOpacity(0.15),
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: const Text(
//                           "In Stock",
//                           style: TextStyle(
//                             color: Colors.green,
//                             fontSize: 12,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),

//                   const SizedBox(height: 16),

//                   // 🔹 PRODUCT DETAILS
//                   _sectionTitle("Product Details"),
//                   const Text(
//                     "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
//                     style: TextStyle(
//                       color: Colors.grey,
//                       height: 1.6,
//                     ),
//                   ),

//                   const SizedBox(height: 24),

//                   // 🔹 QUANTITY
//                   _sectionTitle("Quantity"),
//                   Row(
//                     children: [
//                       _qtyButton(
//                         icon: Icons.remove,
//                         onTap: () {
//                           if (quantity > 1) {
//                             setState(() => quantity--);
//                           }
//                         },
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 16),
//                         child: Text(
//                           quantity.toString(),
//                           style: const TextStyle(
//                               fontSize: 16, fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                       _qtyButton(
//                         icon: Icons.add,
//                         onTap: () => setState(() => quantity++),
//                       ),
//                     ],
//                   ),

//                   const SizedBox(height: 30),

//                   // 🔹 REVIEWS
//                   _sectionTitle("Customer Reviews"),
//                   const SizedBox(height: 12),

//                   ...reviews.map((review) => _reviewCard(review)),

//                   const SizedBox(height: 16),

//                   // 🔹 WRITE REVIEW BUTTON
//                   OutlinedButton.icon(
//                     onPressed: _showWriteReview,
//                     icon: const Icon(Icons.rate_review_outlined),
//                     label: const Text("Write a Review"),
//                   ),

//                   const SizedBox(height: 100),
//                 ],
//               ),
//             ),
//           ),

//           // 🔹 BOTTOM BAR
//           Container(
//             padding: const EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.05),
//                   blurRadius: 12,
//                 )
//               ],
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   price,
//                   style: const TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 ElevatedButton.icon(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFF3A1212),
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 24, vertical: 14),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(14),
//                     ),
//                   ),
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) => CartScreen(
//                           initialCartItem: {
//                             "name": name,
//                             "price": int.tryParse(
//                                     price.replaceAll(RegExp(r'[^0-9]'), '')) ??
//                                 0,
//                             "quantity": quantity,
//                             "image": image,
//                           },
//                         ),
//                       ),
//                     );
//                   },
//                   icon: const Icon(Icons.shopping_bag_outlined),
//                   label: const Text(
//                     "Add to Cart",
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // 🔹 HELPERS

//   Widget _sectionTitle(String text) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 8),
//       child: Text(
//         text,
//         style: const TextStyle(
//           fontSize: 17,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }

//   Widget _tag(String text) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//       decoration: BoxDecoration(
//         color: Colors.blueGrey.withOpacity(0.15),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Text(
//         text,
//         style: const TextStyle(
//           fontSize: 12,
//           fontWeight: FontWeight.w600,
//           color: Colors.blueGrey,
//         ),
//       ),
//     );
//   }

//   Widget _qtyButton({required IconData icon, required VoidCallback onTap}) {
//     return InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(10),
//       child: Container(
//         padding: const EdgeInsets.all(8),
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.grey.shade300),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Icon(icon, size: 18),
//       ),
//     );
//   }

//   Widget _reviewCard(Map<String, String> review) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 12),
//       padding: const EdgeInsets.all(14),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(14),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.04),
//             blurRadius: 8,
//           )
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             review["name"]!,
//             style: const TextStyle(fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 6),
//           Text(review["comment"]!,
//               style: const TextStyle(color: Colors.grey)),
//         ],
//       ),
//     );
//   }

//   void _showWriteReview() {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (_) => Padding(
//         padding: EdgeInsets.only(
//             bottom: MediaQuery.of(context).viewInsets.bottom,
//             left: 16,
//             right: 16,
//             top: 20),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const Text(
//               "Write a Review",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 12),
//             TextField(
//               maxLines: 3,
//               decoration: InputDecoration(
//                 hintText: "Share your experience...",
//                 border:
//                     OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//               ),
//             ),
//             const SizedBox(height: 12),
//             ElevatedButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text("Submit"),
//             ),
//             const SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }
// }








// import 'package:flutter/material.dart';
// import 'cart.dart';

// class ProductDetailScreen extends StatefulWidget {
//   final Map<String, dynamic> product;

//   const ProductDetailScreen({
//     super.key,
//     required this.product,
//   });

//   @override
//   State<ProductDetailScreen> createState() => _ProductDetailScreenState();
// }

// class _ProductDetailScreenState extends State<ProductDetailScreen> {
//   int quantity = 1;
//   final TextEditingController reviewController = TextEditingController();
//   bool reviewSent = false;

//   final List<Map<String, String>> reviews = [
//     {
//       "name": "Sonam",
//       "comment": "Great quality, looks premium!",
//     },
//     {
//       "name": "Tashi",
//       "comment": "Value for money. Delivery was fast.",
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final product = widget.product;
//     final int stock = product["stock"] ?? 0;
    

//     return Scaffold(
//       backgroundColor: const Color(0xFFF9F9F9),

//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 255, 255, 255),
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: const Text(
//           "Product Details",
//           style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
//         ),
//         centerTitle: true,
//         actions: const [
//           Padding(
//             padding: EdgeInsets.only(right: 12),
//             child: Icon(Icons.favorite_border, color: Colors.black),
//           )
//         ],
//       ),

//       body: Column(
//         children: [
//           Expanded(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [

//                   /// IMAGE
//                   _card(
//                     height: 280,
//                     child: Image.asset(product["image"], fit: BoxFit.cover),
//                   ),

//                   const SizedBox(height: 20),

//                   Text(
//                     product["name"],
//                     style: const TextStyle(
//                         fontSize: 22, fontWeight: FontWeight.bold),
//                   ),

//                   const SizedBox(height: 6),

//                   Row(
//                     children: [
//                       _tag(product["type"]),
//                       const SizedBox(width: 8),
//                       Text(product["category"],
//                           style: const TextStyle(color: Colors.grey)),
//                     ],
//                   ),

//                   const SizedBox(height: 12),

//                   /// STORE + STOCK
//        Row(
//   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   children: [
//     Text(
//       "Store: ${product["store"]}",
//       style: const TextStyle(fontWeight: FontWeight.w600),
//     ),
//     Container(
//       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//       decoration: BoxDecoration(
//         color: stock > 0
//             ? Colors.green.withOpacity(0.15)
//             : Colors.red.withOpacity(0.15),
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Text(
//         stock > 0 ? "$stock in stock" : "Out of stock",
//         style: TextStyle(
//           color: stock > 0 ? Colors.green : Colors.red,
//           fontSize: 12,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     ),
//   ],
// ),


//                   const SizedBox(height: 20),

//                   _sectionTitle("Product Details"),
//                   const Text(
//                     "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
//                     style: TextStyle(color: Colors.grey, height: 1.6),
//                   ),

//                   const SizedBox(height: 24),

//                   _sectionTitle("Quantity"),
//                   Row(
//                     children: [
//                       _qtyButton(Icons.remove, () {
//                         if (quantity > 1) setState(() => quantity--);
//                       }),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 16),
//                         child: Text(quantity.toString(),
//                             style: const TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.bold)),
//                       ),
//                       _qtyButton(Icons.add, () {
//                         setState(() => quantity++);
//                       }),
//                     ],
//                   ),

//                   const SizedBox(height: 32),

//                   /// REVIEWS
//                   _sectionTitle("Customer Reviews"),

//                   GridView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: reviews.length,
//                     gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       crossAxisSpacing: 12,
//                       mainAxisSpacing: 12,
//                       childAspectRatio: 1.2,
//                     ),
//                     itemBuilder: (_, index) =>
//                         _reviewCard(reviews[index]),
//                   ),

//                   const SizedBox(height: 24),

//                   /// WRITE REVIEW SECTION
//                   _sectionTitle("Write a Review"),

//                   if (reviewSent)
//                     Container(
//                       margin: const EdgeInsets.only(bottom: 12),
//                       padding: const EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                         color: Colors.green.withOpacity(0.1),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: const Text(
//                         "✅ Your review has been sent",
//                         style: TextStyle(
//                             color: Colors.green,
//                             fontWeight: FontWeight.w600),
//                       ),
//                     ),

//                   TextField(
//                     controller: reviewController,
//                     maxLines: 3,
//                     decoration: InputDecoration(
//                       hintText: "Share your experience...",
//                       filled: true,
//                       fillColor: Colors.white,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                   ),

//                   const SizedBox(height: 12),

//                   Align(
//                     alignment: Alignment.centerRight,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         if (reviewController.text.isNotEmpty) {
//                           setState(() {
//                             reviews.add({
//                               "name": "You",
//                               "comment": reviewController.text,
//                             });
//                             reviewController.clear();
//                             reviewSent = true;
//                           });
//                         }
//                       },
//                       child: const Text("Submit Review"),
//                     ),
//                   ),

//                   const SizedBox(height: 100),
//                 ],
//               ),
//             ),
//           ),

//           /// BOTTOM BAR
//           _bottomBar(product),
//         ],
//       ),
//     );
//   }

//   // ================= HELPERS =================

// Widget _card({required Widget child, double? height}) {
//   return Container(
//     height: height ?? 300,
//     padding: const EdgeInsets.all(20),
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(20),
//       boxShadow: [
//         BoxShadow(
//           color: Colors.black.withOpacity(0.05),
//           blurRadius: 12,
//         ),
//       ],
//     ),
//     child: Center(child: child),
//   );
// }

//   Widget _sectionTitle(String text) => Padding(
//         padding: const EdgeInsets.only(bottom: 8),
//         child: Text(text,
//             style: const TextStyle(
//                 fontSize: 17, fontWeight: FontWeight.bold)),
//       );

//   Widget _tag(String text) => Container(
//         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//         decoration: BoxDecoration(
//           color: Colors.blueGrey.withOpacity(0.15),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Text(text,
//             style: const TextStyle(
//                 fontSize: 12,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.blueGrey)),
//       );

//   Widget _statusChip(String text) => Container(
//         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//         decoration: BoxDecoration(
//           color: Colors.green.withOpacity(0.15),
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Text(text,
//             style: const TextStyle(
//                 color: Colors.green,
//                 fontSize: 12,
//                 fontWeight: FontWeight.bold)),
//       );

//   Widget _qtyButton(IconData icon, VoidCallback onTap) => InkWell(
//         onTap: onTap,
//         borderRadius: BorderRadius.circular(10),
//         child: Container(
//           padding: const EdgeInsets.all(8),
//           decoration: BoxDecoration(
//             border: Border.all(color: Colors.grey.shade300),
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Icon(icon, size: 18),
//         ),
//       );

//   Widget _reviewCard(Map<String, String> review) => _card(
//         child: Padding(
//           padding: const EdgeInsets.all(12),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(review["name"]!,
//                   style: const TextStyle(fontWeight: FontWeight.bold)),
//               const SizedBox(height: 6),
//               Expanded(
//                 child: Text(
//                   review["comment"]!,
//                   style: const TextStyle(color: Colors.grey),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );

//   Widget _bottomBar(Map product) => Container(
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 12),
//           ],
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(product["price"],
//                 style:
//                     const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//             ElevatedButton.icon(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color(0xFF3A1212),
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(14)),
//               ),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (_) => CartScreen(
//                       initialCartItem: {
//                         "name": product["name"],
//                         "price": int.parse(
//                             product["price"].replaceAll(RegExp(r'[^0-9]'), '')),
//                         "quantity": quantity,
//                         "image": product["image"],
//                       },
//                     ),
//                   ),
//                 );
//               },
//               icon: const Icon(Icons.shopping_bag_outlined),
//               label: const Text("Add to Cart",
//                   style: TextStyle(fontWeight: FontWeight.bold)),
//             ),
//           ],
//         ),
//       );
// }



import 'package:flutter/material.dart';
import 'cart.dart';

class ProductDetailScreen extends StatefulWidget {
  final Map<String, dynamic> product;

  const ProductDetailScreen({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int quantity = 1;
  final TextEditingController reviewController = TextEditingController();
  bool reviewSent = false;
  int selectedRating = 5;

  final List<Map<String, dynamic>> reviews = [
    {
      "comment": "Great quality, looks premium!",
      "rating": 5,
      "likes": 2,
      "liked": false,
    },
    {
      "comment": "Value for money. Delivery was fast.",
      "rating": 4,
      "likes": 1,
      "liked": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final int stock = product["stock"] ?? 0;

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Product Details",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.favorite_border, color: Colors.black),
          )
        ],
      ),

      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  _card(
                    height: 280,
                    child: Image.asset(product["image"], fit: BoxFit.cover),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    product["name"],
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 6),

                  Row(
                    children: [
                      _tag(product["type"]),
                      const SizedBox(width: 8),
                      Text(product["category"],
                          style: const TextStyle(color: Colors.grey)),
                    ],
                  ),

                  const SizedBox(height: 12),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Store: ${product["store"]}",
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: stock > 0
                              ? Colors.green.withOpacity(0.15)
                              : Colors.red.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          stock > 0 ? "$stock in stock" : "Out of stock",
                          style: TextStyle(
                            color: stock > 0 ? Colors.green : Colors.red,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 32),

                  /// ⭐ CUSTOMER REVIEWS
                  _sectionTitle("Customer Reviews"),

                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: reviews.length,
                    separatorBuilder: (_, __) =>
                        const SizedBox(height: 12),
                    itemBuilder: (_, index) =>
                        _modernReviewCard(index),
                  ),

                  const SizedBox(height: 28),

                  /// ✍️ WRITE REVIEW
                  _sectionTitle("Write a Review"),

                  _ratingSelector(),

                  const SizedBox(height: 12),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: reviewController,
                      maxLines: 4,
                      decoration: const InputDecoration(
                        hintText: "Share your experience...",
                        contentPadding: EdgeInsets.all(16),
                        border: InputBorder.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {
                        if (reviewController.text.isNotEmpty) {
                          setState(() {
                            reviews.insert(0, {
                              "comment": reviewController.text,
                              "rating": selectedRating,
                              "likes": 0,
                              "liked": false,
                            });
                            reviewController.clear();
                            selectedRating = 5;
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text("Submit Review"),
                    ),
                  ),

                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),

          _bottomBar(product),
        ],
      ),
    );
  }

  // ================= HELPERS =================

  Widget _card({required Widget child, double? height}) {
    return Container(
      height: height ?? 300,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
          ),
        ],
      ),
      child: Center(child: child),
    );
  }

  Widget _sectionTitle(String text) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(text,
            style: const TextStyle(
                fontSize: 17, fontWeight: FontWeight.bold)),
      );

  Widget _tag(String text) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.blueGrey.withOpacity(0.15),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(text,
            style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.blueGrey)),
      );

  /// ⭐ STAR SELECTOR
  Widget _ratingSelector() => Row(
        children: List.generate(5, (index) {
          return IconButton(
            onPressed: () {
              setState(() => selectedRating = index + 1);
            },
            icon: Icon(
              index < selectedRating ? Icons.star : Icons.star_border,
              color: Colors.amber,
            ),
          );
        }),
      );

  /// ⭐ MODERN REVIEW CARD + 👍 HELPFUL
  Widget _modernReviewCard(int index) {
    final review = reviews[index];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: List.generate(
              5,
              (i) => Icon(
                i < review["rating"] ? Icons.star : Icons.star_border,
                size: 16,
                color: Colors.amber,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            review["comment"],
            style: const TextStyle(color: Colors.grey, height: 1.5),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    review["liked"] = !review["liked"];
                    review["likes"] += review["liked"] ? 1 : -1;
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      review["liked"]
                          ? Icons.thumb_up
                          : Icons.thumb_up_outlined,
                      size: 18,
                      color:
                          review["liked"] ? Colors.black : Colors.grey,
                    ),
                    const SizedBox(width: 6),
                    Text("${review["likes"]}",
                        style: const TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _bottomBar(Map product) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 12),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(product["price"],
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3A1212),
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CartScreen(
                      initialCartItem: {
                        "name": product["name"],
                        "price": int.parse(
                            product["price"].replaceAll(RegExp(r'[^0-9]'), '')),
                        "quantity": quantity,
                        "image": product["image"],
                      },
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.shopping_bag_outlined,
                  color: Colors.white),
              label: const Text(
                "Add to Cart",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ],
        ),
      );
}
