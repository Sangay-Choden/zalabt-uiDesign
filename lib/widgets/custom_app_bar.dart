




// import 'package:flutter/material.dart';
// import 'hammenu.dart';
// import '../screens/cart.dart'; 

// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final String title;

//   const CustomAppBar({super.key, this.title = "zala.bt"});

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       elevation: 0,
//       backgroundColor: const Color.fromARGB(255, 246, 235, 221),

//       // slightly increase to be safe on small phones
//       leadingWidth: 170,

//       leading: Row(
//         children: [
//           const SizedBox(width: 8),

//           // Hamburger Icon
//           InkWell(
//             borderRadius: BorderRadius.circular(12),
//             onTap: () {
//               Navigator.of(context).push(
//                 PageRouteBuilder(
//                   opaque: false,
//                   pageBuilder: (_, __, ___) => const HamMenu(),
//                 ),
//               );
//             },
//             child: Container(
//               padding: const EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 color: Colors.transparent,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: const Icon(
//                 Icons.menu,
//                 color: Colors.black,
//                 size: 22,
//               ),
//             ),
//           ),

//           const SizedBox(width: 8),

//           // ✅ Prevent overflow safely
//           Expanded(
//             child: Text(
//               title,
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//               style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18,
//                 color: Colors.black,
//               ),
//             ),
//           ),
//         ],
//       ),

//       actions: [
//         Padding(
//           padding: const EdgeInsets.only(right: 12),
//           child: Stack(
//             children: [
//   IconButton(
//   icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
//   onPressed: () {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (_) => const CartScreen(),
//       ),
//     );
//   },
// ),

//               Positioned(
//                 right: 6,
//                 top: 6,
//                 child: Container(
//                   padding: const EdgeInsets.all(4),
//                   decoration: const BoxDecoration(
//                     color: Colors.red,
//                     shape: BoxShape.circle,
//                   ),
//                   child: const Text(
//                     "2",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 10,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
// }




// import 'package:flutter/material.dart';
// import 'hammenu.dart';
// import '../screens/cart.dart'; 

// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final String title;
//   final Widget? leading; // optional leading widget

//   const CustomAppBar({super.key, this.title = "zala.bt", this.leading});

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       elevation: 0,
//       backgroundColor: const Color.fromARGB(255, 246, 235, 221),
//       leadingWidth: 170,
//       leading: leading ??
//           Row(
//             children: [
//               const SizedBox(width: 8),
//               // Hamburger Icon
//               InkWell(
//                 borderRadius: BorderRadius.circular(12),
//                 onTap: () {
//                   Navigator.of(context).push(
//                     PageRouteBuilder(
//                       opaque: false,
//                       pageBuilder: (_, __, ___) => const HamMenu(),
//                     ),
//                   );
//                 },
//                 child: Container(
//                   padding: const EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     color: Colors.transparent,
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: const Icon(
//                     Icons.menu,
//                     color: Colors.black,
//                     size: 22,
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 8),
//               Expanded(
//                 child: Text(
//                   title,
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//       actions: [
//         Padding(
//           padding: const EdgeInsets.only(right: 12),
//           child: Stack(
//             children: [
//               IconButton(
//                 icon:
//                     const Icon(Icons.shopping_cart_outlined, color: Colors.black),
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (_) => const CartScreen(),
//                     ),
//                   );
//                 },
//               ),
//               Positioned(
//                 right: 6,
//                 top: 6,
//                 child: Container(
//                   padding: const EdgeInsets.all(4),
//                   decoration: const BoxDecoration(
//                     color: Colors.red,
//                     shape: BoxShape.circle,
//                   ),
//                   child: const Text(
//                     "2",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 10,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
// }



import 'package:flutter/material.dart';
import 'hammenu.dart';
import '../screens/cart.dart'; 

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading; // optional leading widget

  const CustomAppBar({super.key, this.title = "zala.bt", this.leading});

  @override
  Widget build(BuildContext context) {
    // If a custom leading is provided (like back button), reduce leadingWidth
    final double effectiveLeadingWidth = leading != null ? 56 : 170;

    return AppBar(
      elevation: 0,
      backgroundColor: const Color.fromARGB(255, 246, 235, 221),
      leadingWidth: effectiveLeadingWidth,
      leading: leading ??
          Row(
            children: [
              const SizedBox(width: 8),
              // Hamburger Icon
              InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (_, __, ___) => const HamMenu(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.menu,
                    color: Colors.black,
                    size: 22,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Stack(
            children: [
              IconButton(
                icon:
                    const Icon(Icons.shopping_cart_outlined, color: Colors.black),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const CartScreen(),
                    ),
                  );
                },
              ),
              Positioned(
                right: 6,
                top: 6,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: const Text(
                    "2",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
