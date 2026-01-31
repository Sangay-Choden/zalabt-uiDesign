import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/bottom_nav.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  final List<Map<String, dynamic>> feedbacks = const [
    {
      "name": "Donga Tenzin Wangchuk",
      "location": "Zhemgang",
      "date": "13-Oct-2024",
      "message": "Delayed ??",
      "rating": 2,
    },
    {
      "name": "Donga Tenzin Wangchuk",
      "location": "Zhemgang",
      "date": "28-Sep-2024",
      "message": "Delayed but still got at the end",
      "rating": 2,
    },
    {
      "name": "Tashi",
      "location": "Thimphu",
      "date": "19-Aug-2024",
      "message": "Delayed",
      "rating": 3,
    },
    {
      "name": "Thekchog",
      "location": "Chukha",
      "date": "03-Aug-2024",
      "message": "Nice app for online shopping",
      "rating": 5,
    },
    {
      "name": "Kinley Dorji",
      "location": "Paro",
      "date": "19-Jul-2024",
      "message": "Very easy to use and smooth experience",
      "rating": 4,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: const CustomAppBar(title: "Feedback"),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: feedbacks.length,
        itemBuilder: (context, index) {
          final fb = feedbacks[index];
          return _FeedbackCard(feedback: fb);
        },
      ),

      bottomNavigationBar: BottomNav(
        currentIndex: 4, // profile / feedback section
        onTap: (_) {},
      ),
    );
  }
}

// ================= FEEDBACK CARD =================

class _FeedbackCard extends StatelessWidget {
  final Map<String, dynamic> feedback;

  const _FeedbackCard({required this.feedback});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: const Color(0xFFD2BEA5),
                child: Text(
                  feedback["name"][0],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      feedback["name"],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "${feedback["location"]} • ${feedback["date"]}",
                      style: const TextStyle(
                        fontSize: 11,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Message
          Text(
            "“${feedback["message"]}”",
            style: const TextStyle(
              fontSize: 14,
              height: 1.4,
            ),
          ),

          const SizedBox(height: 12),

          // Stars
          Row(
            children: List.generate(5, (index) {
              return Icon(
                index < feedback["rating"]
                    ? Icons.star_rounded
                    : Icons.star_border_rounded,
                size: 18,
                color: Colors.amber,
              );
            }),
          ),
        ],
      ),
    );
  }
}
