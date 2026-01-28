// import 'package:flutter/material.dart';

// class CheckoutScreen extends StatefulWidget {
//   const CheckoutScreen({super.key});

//   @override
//   State<CheckoutScreen> createState() => _CheckoutScreenState();
// }

// class _CheckoutScreenState extends State<CheckoutScreen> {
//   String payment = "delivery";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF6F7FB),

//       appBar: AppBar(
//         backgroundColor: Colors.teal,
//         title: const Text("Checkout"),
//       ),

//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             _section(
//               "Delivery Details",
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: const [
//                   Text("Name: Sameer Pradhan"),
//                   Text("Contact: 17687187"),
//                   Text("Address: above olakha park"),
//                 ],
//               ),
//             ),

//             _section(
//               "Payment Details",
//               Column(
//                 children: const [
//                   _priceRow("Total Amount", "Nu. 15000"),
//                   _priceRow("Delivery Charges", "FREE"),
//                   Divider(),
//                   _priceRow("Grand Total", "Nu. 15000", bold: true),
//                 ],
//               ),
//             ),

//             _section(
//               "Payment Method",
//               Column(
//                 children: [
//                   RadioListTile(
//                     value: "delivery",
//                     groupValue: payment,
//                     onChanged: (v) => setState(() => payment = v.toString()),
//                     title: const Text("Payment on Delivery"),
//                   ),
//                   RadioListTile(
//                     value: "mobile",
//                     groupValue: payment,
//                     onChanged: (v) => setState(() => payment = v.toString()),
//                     title: const Text("Mobile Payment"),
//                   ),
//                   RadioListTile(
//                     value: "voucher",
//                     groupValue: payment,
//                     onChanged: (v) => setState(() => payment = v.toString()),
//                     title: const Text("Vouchers & Gift Cards"),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),

//       bottomNavigationBar: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(12),
//           child: ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.orange,
//               minimumSize: const Size(double.infinity, 52),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(14),
//               ),
//             ),
//             onPressed: () {},
//             child: const Text("Confirm Purchase"),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _section(String title, Widget child) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 14),
//       padding: const EdgeInsets.all(14),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(14),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(title,
//               style:
//                   const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
//           const SizedBox(height: 10),
//           child,
//         ],
//       ),
//     );
//   }
// }

// class _priceRow extends StatelessWidget {
//   final String t1;
//   final String t2;
//   final bool bold;

//   const _priceRow(this.t1, this.t2, {this.bold = false});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(t1),
//           Text(
//             t2,
//             style: TextStyle(
//               fontWeight: bold ? FontWeight.bold : FontWeight.normal,
//               color: bold ? Colors.red : Colors.black,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;
  final int totalPrice;

  const CheckoutScreen({
    super.key,
    required this.cartItems,
    required this.totalPrice,
  });

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String payment = "delivery";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        title: const Text("Checkout",
            style: TextStyle(color: Colors.black)),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _addressCard(),
          _itemsPreview(),
          _priceSummary(),
          _paymentMethod(),
          const SizedBox(height: 90),
        ],
      ),

      bottomNavigationBar: _confirmBar(),
    );
  }

  // 📍 ADDRESS
  Widget _addressCard() {
    return _card(
      title: "Delivery Address",
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Sameer Pradhan",
              style: TextStyle(fontWeight: FontWeight.w600)),
          SizedBox(height: 4),
          Text("17687187"),
          SizedBox(height: 4),
          Text("Above Olakha Park, Thimphu"),
        ],
      ),
    );
  }

  // 🛒 CART ITEMS PREVIEW
  Widget _itemsPreview() {
    return _card(
      title: "Order Items",
      child: Column(
        children: widget.cartItems.map((item) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    item["image"],
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    item["name"],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text("x${item["quantity"]}",
                    style: const TextStyle(fontWeight: FontWeight.w600)),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  // 💰 PRICE SUMMARY
  Widget _priceSummary() {
    return _card(
      title: "Price Details",
      child: Column(
        children: [
          _priceRow("Subtotal", "Nu. ${widget.totalPrice}"),
          _priceRow("Delivery", "FREE"),
          const Divider(height: 24),
          _priceRow(
            "Grand Total",
            "Nu. ${widget.totalPrice}",
            bold: true,
          ),
        ],
      ),
    );
  }

  // 💳 PAYMENT METHOD
  Widget _paymentMethod() {
    return _card(
      title: "Payment Method",
      child: Column(
        children: [
          _paymentTile("delivery", "Cash on Delivery", Icons.payments),
          _paymentTile("mobile", "Mobile Payment", Icons.phone_android),
          _paymentTile("voucher", "Voucher / Gift Card", Icons.card_giftcard),
        ],
      ),
    );
  }

  Widget _paymentTile(String value, String title, IconData icon) {
    final selected = payment == value;

    return InkWell(
      onTap: () => setState(() => payment = value),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: selected ? Colors.orange : Colors.grey.shade300,
          ),
          color: selected ? Colors.orange.withOpacity(0.08) : Colors.white,
        ),
        child: Row(
          children: [
            Icon(icon,
                color: selected ? Colors.orange : Colors.grey),
            const SizedBox(width: 12),
            Expanded(child: Text(title)),
            if (selected)
              const Icon(Icons.check_circle, color: Colors.orange),
          ],
        ),
      ),
    );
  }

  // 🔘 CONFIRM BAR
  Widget _confirmBar() {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            minimumSize: const Size(double.infinity, 54),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          ),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Order placed successfully!")),
            );
          },
          child: Text(
            "Confirm & Pay  •  Nu. ${widget.totalPrice}",
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }

  // 🧱 COMMON CARD
  Widget _card({required String title, required Widget child}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 14),
          child,
        ],
      ),
    );
  }

  Widget _priceRow(String t1, String t2, {bool bold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(child: Text(t1)),
          Text(
            t2,
            style: TextStyle(
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
              color: bold ? Colors.orange : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
