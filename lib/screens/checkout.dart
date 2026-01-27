import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

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
        backgroundColor: Colors.teal,
        title: const Text("Checkout"),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _section(
              "Delivery Details",
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Name: Sameer Pradhan"),
                  Text("Contact: 17687187"),
                  Text("Address: above olakha park"),
                ],
              ),
            ),

            _section(
              "Payment Details",
              Column(
                children: const [
                  _priceRow("Total Amount", "Nu. 15000"),
                  _priceRow("Delivery Charges", "FREE"),
                  Divider(),
                  _priceRow("Grand Total", "Nu. 15000", bold: true),
                ],
              ),
            ),

            _section(
              "Payment Method",
              Column(
                children: [
                  RadioListTile(
                    value: "delivery",
                    groupValue: payment,
                    onChanged: (v) => setState(() => payment = v.toString()),
                    title: const Text("Payment on Delivery"),
                  ),
                  RadioListTile(
                    value: "mobile",
                    groupValue: payment,
                    onChanged: (v) => setState(() => payment = v.toString()),
                    title: const Text("Mobile Payment"),
                  ),
                  RadioListTile(
                    value: "voucher",
                    groupValue: payment,
                    onChanged: (v) => setState(() => payment = v.toString()),
                    title: const Text("Vouchers & Gift Cards"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              minimumSize: const Size(double.infinity, 52),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            onPressed: () {},
            child: const Text("Confirm Purchase"),
          ),
        ),
      ),
    );
  }

  Widget _section(String title, Widget child) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }
}

class _priceRow extends StatelessWidget {
  final String t1;
  final String t2;
  final bool bold;

  const _priceRow(this.t1, this.t2, {this.bold = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(t1),
          Text(
            t2,
            style: TextStyle(
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
              color: bold ? Colors.red : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
