import 'package:flutter/material.dart';
import 'product_detail.dart';
import '../widgets/bottom_nav.dart';

class AllProductScreen extends StatefulWidget {
  const AllProductScreen({super.key});

  @override
  State<AllProductScreen> createState() => _AllProductScreenState();
}

class _AllProductScreenState extends State<AllProductScreen> {
  int _currentIndex = 2; // Store tab active

  static final List<Map<String, dynamic>> allProducts = [
        {
      "image": "assets/watch.jpg",
      "name": "Smart Watch Series 8",
      "category": "Electronics",
      "type": "Wearables",
      "stock": 8,
      "price": "Nu. 4,200",
      "store": "Bhutan Express",
    },
    {
      "image": "assets/laptop.png",
      "name": "Gaming Laptop",
      "category": "Electronics",
      "type": "Computers",
      "stock": 5,
      "price": "Nu. 85,000",
      "store": "Bhutan Express",
    },
    {
      "image": "assets/headphone.jpg",
      "name": "Foldable Saw 18\" - SRPP18 - (UYUSTOOLS)",
      "category": "Tools",
      "type": "Hardware",
      "stock": 42,
      "price": "Nu. 490.00",
      "store": "Bhutan Express",
    },
    {
      "image": "assets/headphone.jpg",
      "name": "Wireless Headset Pro",
      "category": "Electronics",
      "type": "Hardware",
      "stock": 15,
      "price": "Nu. 2,500",
      "store": "Bhutan Express",
    },
    {
      "image": "assets/watch.jpg",
      "name": "Smart Watch Series 8",
      "category": "Electronics",
      "type": "Wearables",
      "stock": 8,
      "price": "Nu. 4,200",
      "store": "Bhutan Express",
    },
    {
      "image": "assets/laptop.png",
      "name": "Gaming Laptop",
      "category": "Electronics",
      "type": "Computers",
      "stock": 5,
      "price": "Nu. 85,000",
      "store": "Bhutan Express",
    },
        {
      "image": "assets/watch.jpg",
      "name": "Smart Watch Series 8",
      "category": "Electronics",
      "type": "Wearables",
      "stock": 8,
      "price": "Nu. 4,200",
      "store": "Bhutan Express",
    },
    {
      "image": "assets/laptop.png",
      "name": "Gaming Laptop",
      "category": "Electronics",
      "type": "Computers",
      "stock": 5,
      "price": "Nu. 85,000",
      "store": "Bhutan Express",
    },
  ];

  void _onBottomNavTap(int index) {
    setState(() => _currentIndex = index);

    // Navigation logic later if needed
    // Example:
    // if (index == 0) Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // 🔵 APP BAR
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 246, 235, 221),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "All Products",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),

      // 🔵 BODY
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: GridView.builder(
          itemCount: allProducts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            childAspectRatio: 0.65,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProductDetailScreen(
                      product: allProducts[index],
                    ),
                  ),
                );
              },
              child: _productCard(allProducts[index]),
            );
          },
        ),
      ),

      // 🔵 CUSTOM BOTTOM NAV
      bottomNavigationBar: BottomNav(
        currentIndex: _currentIndex,
        onTap: _onBottomNavTap,
      ),
    );
  }

  // 🧾 PRODUCT CARD
  Widget _productCard(Map<String, dynamic> product) {
    final String image = product["image"];
    final String name = product["name"];
    final String type = product["type"];
    final String category = product["category"];
    final int stock = product["stock"];
    final String price = product["price"];
    final String store = product["store"];


    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
            child: Image.asset(
              image,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: const Color(0xFF7B95AC).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    type,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF7B95AC),
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(category, style: const TextStyle(fontSize: 11, color: Colors.grey)),
                const SizedBox(height: 4),
                Text(
                  "Stock: $stock",
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color.fromARGB(255, 98, 125, 149),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: stock > 0
                            ? const Color(0xFF3A1212)
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
