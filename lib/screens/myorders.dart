import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/bottom_nav.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  final List<Map<String, dynamic>> orders = const [
    {
      "product": "Wood Chair",
      "image": "https://via.placeholder.com/100",
      "qty": 1,
      "orderNo": "17400640128815214",
      "payment": "Payment on Delivery",
      "time": "20-Feb-2025 • 8:28 AM",
      "status": "Canceled",
      "total": 10.00,
    },
    {
      "product": "Sofa Chair",
      "image": "https://via.placeholder.com/100",
      "qty": 2,
      "orderNo": "1730894975833493",
      "payment": "Payment on Delivery",
      "time": "06-Nov-2024 • 12:09 PM",
      "status": "Delivered",
      "total": 100.00,
    },
  ];

  Color _statusColor(String status) {
    switch (status.toLowerCase()) {
      case 'delivered':
        return Colors.green;
      case 'canceled':
        return Colors.redAccent;
      default:
        return Colors.orange;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      appBar: const CustomAppBar(title: "My Orders"),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: orders.length,
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final order = orders[index];

          final product = order['product']?.toString() ?? "Product";
          final image = order['image']?.toString() ?? "";
          final qty = order['qty'] ?? 1;
          final orderNo = order['orderNo']?.toString() ?? "-";
          final payment = order['payment']?.toString() ?? "-";
          final time = order['time']?.toString() ?? "-";
          final status = order['status']?.toString() ?? "Unknown";
          final total = (order['total'] ?? 0).toDouble();

          return Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              children: [

                /// Product Row
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        image,
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) =>
                            Container(width: 70, height: 70, color: Colors.grey[300]),
                      ),
                    ),
                    const SizedBox(width: 12),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(product,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600)),
                          const SizedBox(height: 4),
                          Text("Qty: $qty",
                              style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                        ],
                      ),
                    ),

                    Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: _statusColor(status).withOpacity(0.12),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(status,
                          style: TextStyle(
                              color: _statusColor(status),
                              fontSize: 12,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                _infoRow("Order No", orderNo),
                _infoRow("Payment", payment),
                _infoRow("Time", time),

                const SizedBox(height: 12),
                const Divider(),

                /// Total + Feedback
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Total: Nu. ${total.toStringAsFixed(2)}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),

                    if (status.toLowerCase() == 'delivered')
                      _actionButton("Feedback", Icons.star, Colors.green),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNav(
        currentIndex: 3,
        onTap: (_) {},
      ),
    );
  }

  Widget _infoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(title,
                style: TextStyle(color: Colors.grey.shade600, fontSize: 13)),
          ),
          Expanded(
            child: Text(value,
                style:
                    const TextStyle(fontSize: 13.5, fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }

  Widget _actionButton(String text, IconData icon, Color color) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 16),
      label: Text(text, style: const TextStyle(fontSize: 12)),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
