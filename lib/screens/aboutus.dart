import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/bottom_nav.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: const CustomAppBar(title: "About Zala.bt"),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [
            _HeaderCard(),
            SizedBox(height: 16),
            _InfoCard(
              title: "Our Purpose",
              content:
                  "At Zala.bt, our purpose is simple: to redefine convenience!\n\n"
                  "There's this notion that to grow a business, you have to be ruthless. "
                  "But we know there's a better way to grow. One where what's good for the bottom line "
                  "is also good for customers.\n\n"
                  "We believe businesses can grow with a conscience and succeed with a soul – and that they can do it with Zala.bt.",
            ),
            SizedBox(height: 16),
            _InfoCard(
              title: "Our Mission",
              content:
                  "We aim to redefine Bhutan’s shopping experience for our customers. "
                  "We are creating an experience that lets customers shop anytime, anywhere – "
                  "delivering exactly what they want, when and where they want it.",
            ),
            SizedBox(height: 16),
            _InfoCard(
              title: "Who We Are",
              content:
                  "Zala.bt is Bhutan’s pioneering e-commerce shopping destination, present through a physical retail store, "
                  "online portal, and mobile application.\n\n"
                  "Our footprint currently extends to over 79 registered stores from every part of the country, "
                  "with diverse product portfolios ranging from electronics, IT equipment, fashion, household items, "
                  "and much more.",
            ),
            SizedBox(height: 30),
          ],
        ),
      ),

      bottomNavigationBar: BottomNav(
        currentIndex: 2, // change if needed
        onTap: (_) {},
      ),
    );
  }
}

////////////////////////////////////////////////////////////
/// HEADER CARD
////////////////////////////////////////////////////////////

class _HeaderCard extends StatelessWidget {
  const _HeaderCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 38,
            backgroundColor: Colors.grey.shade100,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                "assets/zala_logo.png", // 🔁 replace with your actual logo path
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            "Zala.bt",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            "Shop Online",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              "Version 2.0.14",
              style: TextStyle(
                fontSize: 12,
                color: Colors.blue,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

////////////////////////////////////////////////////////////
/// INFO CARD
////////////////////////////////////////////////////////////

class _InfoCard extends StatelessWidget {
  final String title;
  final String content;

  const _InfoCard({
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            content,
            style: const TextStyle(
              fontSize: 14,
              height: 1.6,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
