
// import 'package:flutter/material.dart';
// import '../widgets/bottom_nav.dart';
// import 'checkout.dart';

// class CartScreen extends StatefulWidget {
//   const CartScreen({super.key});

//   @override
//   State<CartScreen> createState() => _CartScreenState();
// }

// class _CartScreenState extends State<CartScreen> {
//   final List<Map<String, dynamic>> cartItems = [
//     {
//       "name": "Compound Miter Saw",
//       "price": 15000,
//       "quantity": 1,
//       "image": "assets/headphone.jpg",
//     },
//   ];

//   int get totalPrice => cartItems.fold(
//         0,
//         (sum, item) => sum + item["price"] * item["quantity"] as int,
//       );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF6F7FB),

//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         leading: const BackButton(color: Colors.black),
//         title: Text(
//           "Shopping Cart (${cartItems.length})",
//           style: const TextStyle(color: Colors.black),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => setState(() => cartItems.clear()),
//             child: const Text("Clear All",
//                 style: TextStyle(color: Colors.orange)),
//           ),
//         ],
//       ),

//       body: Column(
//         children: [
//           _addressBar(),

//           Expanded(
//             child: ListView.builder(
//               padding: const EdgeInsets.all(12),
//               itemCount: cartItems.length,
//               itemBuilder: (_, index) {
//                 final item = cartItems[index];

//                 return Dismissible(
//                   key: ValueKey(item["name"]),
//                   direction: DismissDirection.endToStart,
//                   onDismissed: (_) =>
//                       setState(() => cartItems.removeAt(index)),
//                   background: Container(
//                     alignment: Alignment.centerRight,
//                     padding: const EdgeInsets.only(right: 20),
//                     decoration: BoxDecoration(
//                       color: Colors.red,
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                     child: const Icon(Icons.delete, color: Colors.white),
//                   ),
//                   child: _cartCard(item, index),
//                 );
//               },
//             ),
//           ),

//           _totalSection(),

//           _checkoutButton(context),
//         ],
//       ),

//       bottomNavigationBar: BottomNav(
//         currentIndex: 2,
//         onTap: (_) {},
//       ),
//     );
//   }

//   Widget _cartCard(Map item, int index) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 12),
//       padding: const EdgeInsets.all(14),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(18),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 8,
//             offset: const Offset(0, 5),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(14),
//             child: Image.asset(
//               item["image"],
//               width: 80,
//               height: 80,
//               fit: BoxFit.cover,
//             ),
//           ),

//           const SizedBox(width: 12),

//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   item["name"],
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                   style: const TextStyle(
//                       fontWeight: FontWeight.w600, fontSize: 15),
//                 ),
//                 const SizedBox(height: 6),
//                 Text(
//                   "Nu. ${item["price"]}",
//                   style: const TextStyle(
//                       color: Colors.orange,
//                       fontWeight: FontWeight.w600),
//                 ),
//                 const SizedBox(height: 10),

//                 Row(
//                   children: [
//                     _qtyButton(Icons.remove, () {
//                       if (item["quantity"] > 1) {
//                         setState(() => item["quantity"]--);
//                       }
//                     }),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 12),
//                       child: Text(
//                         item["quantity"].toString(),
//                         style: const TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     _qtyButton(Icons.add, () {
//                       setState(() => item["quantity"]++);
//                     }),
//                   ],
//                 ),
//               ],
//             ),
//           ),

//           IconButton(
//             icon: const Icon(Icons.close, color: Colors.red),
//             onPressed: () => setState(() => cartItems.removeAt(index)),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _qtyButton(IconData icon, VoidCallback onTap) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         width: 28,
//         height: 28,
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.grey.shade300),
//           borderRadius: BorderRadius.circular(6),
//         ),
//         child: Icon(icon, size: 16),
//       ),
//     );
//   }

//   Widget _addressBar() {
//     return Container(
//       margin: const EdgeInsets.all(12),
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(14),
//       ),
//       child: const Row(
//         children: [
//           Icon(Icons.location_on_outlined, size: 18),
//           SizedBox(width: 8),
//           Expanded(
//             child: Text(
//               "Sameer Pradhan - above olakha park",
//               overflow: TextOverflow.ellipsis,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // ✅ OVERFLOW FIX IS HERE
//   Widget _totalSection() {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       color: Colors.white,
//       child: Column(
//         children: [
//           _row("Total Amount", "Nu. $totalPrice"),
//           _row("Delivery Charges", "FREE"),
//           const Divider(),
//           _row("Grand Total", "Nu. $totalPrice", bold: true),
//         ],
//       ),
//     );
//   }

//   Widget _row(String t1, String t2, {bool bold = false}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 6),
//       child: Row(
//         children: [
//           Expanded(child: Text(t1)),
//           Expanded(
//             child: Text(
//               t2,
//               textAlign: TextAlign.right,
//               style: TextStyle(
//                 fontWeight: bold ? FontWeight.bold : FontWeight.normal,
//                 color: bold ? Colors.orange : Colors.black,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

// Widget _checkoutButton(BuildContext context) {
//   return SafeArea(
//     child: Padding(
//       padding: const EdgeInsets.all(12),
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.orange,
//           minimumSize: const Size(double.infinity, 54),
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//         ),
//         onPressed: cartItems.isEmpty
//             ? null
//             : () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (_) => CheckoutScreen(
//                       cartItems: cartItems,
//                       totalPrice: totalPrice,
//                     ),
//                   ),
//                 );
//               },
//         child: const Text(
//           "Proceed to Checkout",
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//         ),
//       ),
//     ),
//   );
// }

// }






import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart';
import 'checkout.dart';

class CartScreen extends StatefulWidget {
  final Map<String, dynamic>? initialCartItem; // optional product from ProductDetailScreen

  const CartScreen({super.key, this.initialCartItem});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late List<Map<String, dynamic>> cartItems;

  @override
  void initState() {
    super.initState();
    cartItems = [
      {
        "name": "Compound Miter Saw",
        "price": 15000,
        "quantity": 1,
        "image": "assets/headphone.jpg",
      },
    ];

    // Add product from ProductDetailScreen if provided
    if (widget.initialCartItem != null) {
      cartItems.add(widget.initialCartItem!);
    }
  }

  int get totalPrice => cartItems.fold(
        0,
        (sum, item) => sum + item["price"] * item["quantity"] as int,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 246, 235, 221),
        leading: const BackButton(color: Colors.black),
        title: Text(
          "Shopping Cart (${cartItems.length})",
          style: const TextStyle(color: Colors.black , fontSize: 18),
        ),
        actions: [
          TextButton(
            onPressed: () => setState(() => cartItems.clear()),
            child: const Text("Clear All",
                style: TextStyle(color: Color.fromARGB(255, 55, 35, 5))),
          ),
        ],
      ),
      body: Column(
        children: [
          _addressBar(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: cartItems.length,
              itemBuilder: (_, index) {
                final item = cartItems[index];
                return Dismissible(
                  key: ValueKey(item["name"]),
                  direction: DismissDirection.endToStart,
                  onDismissed: (_) => setState(() => cartItems.removeAt(index)),
                  background: Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  child: _cartCard(item, index),
                );
              },
            ),
          ),
          _totalSection(),
          _checkoutButton(context),
        ],
      ),
      bottomNavigationBar: BottomNav(
        currentIndex: 2,
        onTap: (_) {},
      ),
    );
  }

  Widget _cartCard(Map item, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.asset(
              item["image"],
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item["name"],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 15),
                ),
                const SizedBox(height: 6),
                Text(
                  "Nu. ${item["price"]}",
                  style: const TextStyle(
                      color: Colors.orange, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    _qtyButton(Icons.remove, () {
                      if (item["quantity"] > 1) {
                        setState(() => item["quantity"]--);
                      }
                    }),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        item["quantity"].toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    _qtyButton(Icons.add, () {
                      setState(() => item["quantity"]++);
                    }),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close, color: Colors.red),
            onPressed: () => setState(() => cartItems.removeAt(index)),
          ),
        ],
      ),
    );
  }

  Widget _qtyButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Icon(icon, size: 16),
      ),
    );
  }

  Widget _addressBar() {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: const Row(
        children: [
          Icon(Icons.location_on_outlined, size: 18),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              "Sameer Pradhan - above olakha park",
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _totalSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        children: [
          _row("Total Amount", "Nu. $totalPrice"),
          _row("Delivery Charges", "FREE"),
          const Divider(),
          _row("Grand Total", "Nu. $totalPrice", bold: true),
        ],
      ),
    );
  }

  Widget _row(String t1, String t2, {bool bold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(child: Text(t1)),
          Expanded(
            child: Text(
              t2,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontWeight: bold ? FontWeight.bold : FontWeight.normal,
                color: bold ? Colors.orange : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _checkoutButton(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 241, 208, 158),
            minimumSize: const Size(double.infinity, 54),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          ),
          onPressed: cartItems.isEmpty
              ? null
              : () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CheckoutScreen(
                        cartItems: cartItems,
                        totalPrice: totalPrice,
                      ),
                    ),
                  );
                },
          child: const Text(
            "Proceed to Checkout",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
