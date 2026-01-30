


// import 'package:flutter/material.dart';
// import '../widgets/custom_app_bar.dart';
// import '../widgets/bottom_nav.dart';
// import '../screens/store_detail.dart'; // ✅ ADDED: import store detail screen

// class StoresScreen extends StatefulWidget {
//   const StoresScreen({super.key});

//   @override
//   State<StoresScreen> createState() => _StoresScreenState();
// }

// class _StoresScreenState extends State<StoresScreen> {
//   int currentIndex = 0;

//   final List<Map<String, String>> stores = [
//     {
//       "name": "Bhutan Express",
//       "since": "Oct-2024",
//       "image": "assets/bhutanexpress.png",
//     },
//     {
//       "name": "Ace Flooring and Bathrooms",
//       "since": "Apr-2024",
//       "image": "assets/aceflooring.png",
//     },
//     {
//       "name": "Kid's Kingdom",
//       "since": "Apr-2024",
//       "image": "assets/kidskingdom.jpg",
//     },
//     {
//       "name": "Radak Phunsum Enterprise",
//       "since": "Apr-2024",
//       "image": "assets/radak.png",
//     },
//     {
//       "name": "Sparsh Pearl",
//       "since": "Apr-2024",
//       "image": "assets/sp.png",
//     },
//     {
//       "name": "Junction Book Store",
//       "since": "Apr-2024",
//       "image": "assets/junctionbook.png",
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: const CustomAppBar(title: "Stores"),

//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: GridView.builder(
//           itemCount: stores.length,
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             crossAxisSpacing: 14,
//             mainAxisSpacing: 14,
//             childAspectRatio: 0.82,
//           ),
//           itemBuilder: (context, index) {
//             final store = stores[index];

//             // ✅ ADDED: InkWell for navigation
//             return InkWell(
//               borderRadius: BorderRadius.circular(16),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (_) => StoreDetailScreen(
//                       store: store,
//                     ),
//                   ),
//                 );
//               },
//               child: _StoreCard(
//                 name: store["name"]!,
//                 since: store["since"]!,
//                 image: store["image"]!,
//               ),
//             );
//           },
//         ),
//       ),

//       bottomNavigationBar: BottomNav(
//         currentIndex: 1, // ✅ Stores highlighted
//         onTap: (_) {},
//       ),
//     );
//   }
// }

// // ================= STORE CARD =================

// class _StoreCard extends StatelessWidget {
//   final String name;
//   final String since;
//   final String image;

//   const _StoreCard({
//     required this.name,
//     required this.since,
//     required this.image,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
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
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Store Image
//           Expanded(
//             child: ClipRRect(
//               borderRadius: const BorderRadius.vertical(
//                 top: Radius.circular(16),
//               ),
//               child: Image.asset(
//                 image,
//                 fit: BoxFit.cover,
//                 width: double.infinity,
//               ),
//             ),
//           ),

//           Padding(
//             padding: const EdgeInsets.all(12),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   name,
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 14,
//                   ),
//                 ),
//                 const SizedBox(height: 6),
//                 Text(
//                   "Since: $since",
//                   style: const TextStyle(
//                     fontSize: 12,
//                     color: Colors.grey,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }





import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/bottom_nav.dart';
import '../screens/store_detail.dart';

class StoresScreen extends StatefulWidget {
  const StoresScreen({super.key});

  @override
  State<StoresScreen> createState() => _StoresScreenState();
}

class _StoresScreenState extends State<StoresScreen> {
  int currentIndex = 0;

  final List<Map<String, String>> stores = [
    {
      "name": "Bhutan Express",
      "since": "Oct 2024",
      "image": "assets/bhutanexpress.png",
    },
    {
      "name": "Ace Flooring and Bathrooms",
      "since": "Apr 2024",
      "image": "assets/aceflooring.png",
    },
    {
      "name": "Kid's Kingdom",
      "since": "Apr 2024",
      "image": "assets/kidskingdom.jpg",
    },
    {
      "name": "Radak Phunsum Enterprise",
      "since": "Apr 2024",
      "image": "assets/radak.png",
    },
    {
      "name": "Sparsh Pearl",
      "since": "Apr 2024",
      "image": "assets/sp.png",
    },
    {
      "name": "Junction Book Store",
      "since": "Apr 2024",
      "image": "assets/junctionbook.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: const CustomAppBar(title: "Stores"),

      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: stores.length,
        separatorBuilder: (_, __) => const SizedBox(height: 14),
        itemBuilder: (context, index) {
          final store = stores[index];

          return InkWell(
            borderRadius: BorderRadius.circular(18),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => StoreDetailScreen(store: store),
                ),
              );
            },
            child: _StoreCard(
              name: store["name"]!,
              since: store["since"]!,
              image: store["image"]!,
            ),
          );
        },
      ),

      bottomNavigationBar: BottomNav(
        currentIndex: 1,
        onTap: (_) {},
      ),
    );
  }
}

// ================= STORE CARD =================

class _StoreCard extends StatelessWidget {
  final String name;
  final String since;
  final String image;

  const _StoreCard({
    required this.name,
    required this.since,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 14,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          // LEFT TEXT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Since $since",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          // RIGHT IMAGE
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Container(
              width: 90,
              height: 80,
              color: const Color(0xFFF2F2F2),
              child: Image.asset(
                image,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
