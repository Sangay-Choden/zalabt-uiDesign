// import 'package:flutter/material.dart';
// import '../widgets/bottom_nav.dart';

// class CartScreen extends StatefulWidget {
//   const CartScreen({super.key});

//   @override
//   State<CartScreen> createState() => _CartScreenState();
// }

// class _CartScreenState extends State<CartScreen> {
//   // 🔹 Dummy cart items (replace with real cart data later)
//   final List<Map<String, dynamic>> cartItems = [
//     {
//       "name": "Ceramic Tiles",
//       "price": 1200,
//       "quantity": 2,
//       "image": "assets/tiles.jpg",
//     },
//     {
//       "name": "Bathroom Sink",
//       "price": 3500,
//       "quantity": 1,
//       "image": "assets/sink.jpg",
//     },
//   ];

//   int get totalPrice {
//     return cartItems.fold(
//       0,
//       (sum, item) => sum + (item["price"] * item["quantity"]) as int,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,

//       // ================= APP BAR =================
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: const Text(
//           "Shopping Cart",
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//       ),

//       // ================= BODY =================
//       body: cartItems.isEmpty
//           ? const Center(
//               child: Text(
//                 "Your cart is empty",
//                 style: TextStyle(fontSize: 16, color: Colors.grey),
//               ),
//             )
//           : Column(
//               children: [
//                 Expanded(
//                   child: ListView.builder(
//                     padding: const EdgeInsets.all(16),
//                     itemCount: cartItems.length,
//                     itemBuilder: (context, index) {
//                       final item = cartItems[index];
//                       return _CartItemCard(item: item);
//                     },
//                   ),
//                 ),

//                 // ================= TOTAL =================
//                 Container(
//                   padding: const EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.2),
//                         blurRadius: 10,
//                         offset: const Offset(0, -4),
//                       ),
//                     ],
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text(
//                         "Total",
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text(
//                         "Nu. $totalPrice",
//                         style: const TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.green,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),

//       // ================= BOTTOM NAV =================
//       bottomNavigationBar: BottomNav(
//         currentIndex: 2, // adjust if cart tab index is different
//         onTap: (_) {},
//       ),
//     );
//   }
// }

// // ================= CART ITEM CARD =================

// class _CartItemCard extends StatelessWidget {
//   final Map<String, dynamic> item;

//   const _CartItemCard({required this.item});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 14),
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.15),
//             blurRadius: 10,
//             offset: const Offset(0, 6),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           // Product Image
//           ClipRRect(
//             borderRadius: BorderRadius.circular(12),
//             child: Image.asset(
//               item["image"],
//               width: 80,
//               height: 80,
//               fit: BoxFit.cover,
//             ),
//           ),

//           const SizedBox(width: 12),

//           // Product Info
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   item["name"],
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 14,
//                   ),
//                 ),
//                 const SizedBox(height: 6),
//                 Text(
//                   "Nu. ${item["price"]}",
//                   style: const TextStyle(
//                     fontSize: 13,
//                     color: Colors.grey,
//                   ),
//                 ),
//                 const SizedBox(height: 6),
//                 Text(
//                   "Qty: ${item["quantity"]}",
//                   style: const TextStyle(fontSize: 13),
//                 ),
//               ],
//             ),
//           ),

//           // Remove icon
//           IconButton(
//             icon: const Icon(Icons.delete_outline, color: Colors.red),
//             onPressed: () {},
//           ),
//         ],
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart';
import 'checkout.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<Map<String, dynamic>> cartItems = [
    {
      "name": "Compound Miter Saw",
      "price": 15000,
      "quantity": 1,
      "image": "assets/saw.png",
    },
  ];

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
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        title: Text("Shopping Cart (${cartItems.length})",
            style: const TextStyle(color: Colors.black)),
        actions: [
          TextButton(
            onPressed: () => setState(() => cartItems.clear()),
            child: const Text("Clear All", style: TextStyle(color: Colors.orange)),
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
                  onDismissed: (_) {
                    setState(() => cartItems.removeAt(index));
                  },
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
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(item["image"], width: 80, height: 80, fit: BoxFit.cover),
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item["name"],
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Text("Nu. ${item["price"]}",
                    style: const TextStyle(color: Colors.grey)),
                const SizedBox(height: 10),

                Row(
                  children: [
                    _qtyButton(Icons.remove, () {
                      if (item["quantity"] > 1) {
                        setState(() => item["quantity"]--);
                      }
                    }),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(item["quantity"].toString()),
                    ),
                    _qtyButton(Icons.add, () {
                      setState(() => item["quantity"]++);
                    }),
                  ],
                )
              ],
            ),
          ),

          IconButton(
            icon: const Icon(Icons.close, color: Colors.red),
            onPressed: () => setState(() => cartItems.removeAt(index)),
          )
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
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        children: [
          Icon(Icons.location_on_outlined, size: 18),
          SizedBox(width: 6),
          Expanded(child: Text("Sameer Pradhan - above olakha park")),
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
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(t1),
          Text(t2,
              style: TextStyle(
                  fontWeight: bold ? FontWeight.bold : FontWeight.normal,
                  color: bold ? Colors.red : Colors.black)),
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
            backgroundColor: Colors.orange,
            minimumSize: const Size(double.infinity, 52),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14)),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CheckoutScreen()),
            );
          },
          child: const Text("Proceed to Check Out"),
        ),
      ),
    );
  }
}
