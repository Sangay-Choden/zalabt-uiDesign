import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/bottom_nav.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  int currentIndex = 0;

  // Sample wishlist items
  final List<Map<String, String>> wishlist = [
    {
      "name": "Bhutan Express",
      "since": "Oct-2024",
      "image": "assets/bhutanexpress.png",
    },
    {
      "name": "Ace Flooring and Bathrooms",
      "since": "Apr-2024",
      "image": "assets/aceflooring.png",
    },
    {
      "name": "Kid's Kingdom",
      "since": "Apr-2024",
      "image": "assets/kidskingdom.jpg",
    },
    {
      "name": "Radak Phunsum Enterprise",
      "since": "Apr-2024",
      "image": "assets/radak.png",
    },
  ];

  // Track favorite status
  final List<bool> isFavorite = [true, true, true, true];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: "Wishlist"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: wishlist.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            childAspectRatio: 0.82,
          ),
          itemBuilder: (context, index) {
            final item = wishlist[index];
            return _WishlistCard(
              name: item["name"]!,
              since: item["since"]!,
              image: item["image"]!,
              isFavorite: isFavorite[index],
              onFavoriteToggle: () {
                setState(() {
                  isFavorite[index] = !isFavorite[index];
                });
              },
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNav(
        currentIndex: 2, // Highlight wishlist
        onTap: (_) {},
      ),
    );
  }
}

// ================= WISHLIST CARD =================

class _WishlistCard extends StatelessWidget {
  final String name;
  final String since;
  final String image;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  const _WishlistCard({
    required this.name,
    required this.since,
    required this.image,
    required this.isFavorite,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.15),
                blurRadius: 10,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Store Image
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "Since: $since",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // ❤️ Favorite Icon
        Positioned(
          top: 10,
          right: 10,
          child: GestureDetector(
            onTap: onFavoriteToggle,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                shape: BoxShape.circle,
              ),
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Colors.red,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
