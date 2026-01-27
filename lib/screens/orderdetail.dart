import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/bottom_nav.dart';

class OrderDetailScreen extends StatelessWidget {
  final Map<String, dynamic> order;

  const OrderDetailScreen({super.key, required this.order});

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
    final status = order['status'] ?? "Unknown";

    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      appBar: const CustomAppBar(title: "Order Details"),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            // ===== STATUS BANNER =====
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: _statusColor(status).withOpacity(0.12),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Icon(Icons.local_shipping,
                      color: _statusColor(status)),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      status.toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: _statusColor(status),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // ===== DELIVERY MESSAGE =====
            if (status.toLowerCase() == 'delivered')
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFE9F3FF),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Text(
                  "DELIVERED - The package has safely reached your destination. "
                  "Please check your order. If you have not received your order "
                  "or if your order is incomplete, please do contact us immediately. "
                  "We will try our best to assist you. "
                  "We hope to see you again. Thank you for shopping at zala.bt.",
                  style: TextStyle(fontSize: 13.5, height: 1.5),
                ),
              ),

            const SizedBox(height: 20),

            // ===== PRODUCT CARD =====
            _card(
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.network(
                      order['image'],
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) =>
                          Container(width: 80, height: 80, color: Colors.grey[300]),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order['product'],
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "Quantity: ${order['qty']}",
                          style: TextStyle(
                              color: Colors.grey[600], fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // ===== ORDER INFO =====
            _card(
              child: Column(
                children: [
                  _infoRow("Order No", order['orderNo']),
                  _infoRow("Payment", order['payment']),
                  _infoRow("Order Time", order['time']),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // ===== TOTAL =====
            _card(
              child: Row(
                children: [
                  const Text(
                    "Total Amount",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  Text(
                    "Nu. ${order['total'].toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNav(
        currentIndex: 3,
        onTap: (_) {},
      ),
    );
  }

  // ================= UI HELPERS =================

  Widget _card({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16),
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
      child: child,
    );
  }

  Widget _infoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          SizedBox(
            width: 90,
            child: Text(
              title,
              style: TextStyle(color: Colors.grey[600], fontSize: 13),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                  fontSize: 13.5, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
