import 'package:flutter/material.dart';
import 'package:zala/screens/myorders.dart';
import '../screens/home_screen.dart';
import '../screens/stores.dart';
import '../screens/wishlist.dart';
import '../screens/profile.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  Widget _navItem({
    required BuildContext context,
    required IconData icon,
    required String label,
    required int index,
  }) {
    final bool active = currentIndex == index;

    return GestureDetector(
      onTap: () {
        onTap(index);

        // ================= NAVIGATION =================
        if (index == 0 && currentIndex != 0) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const HomeScreen()),
          );
        }

        if (index == 1 && currentIndex != 1) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const StoresScreen()),
          );
        }

        if (index == 2 && currentIndex != 2) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const WishlistScreen()),
          );
        }

        if (index == 3 && currentIndex != 3) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const MyOrdersScreen()),
          );
        }

    if (index == 4 && currentIndex != 4) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const ProfileScreen()),
          );
        }

      },

      
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: EdgeInsets.symmetric(
          horizontal: active ? 14 : 0,
        ),
        height: 44,
        decoration: BoxDecoration(
          color: active
              ? const Color(0xFF2E2E2E)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(22),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 22,
              color: active
                  ? const Color.fromARGB(255, 241, 227, 209)
                  : const Color(0xFF232323),
            ),
            if (active) ...[
              const SizedBox(width: 6),
              Text(
                label,
                style: const TextStyle(
                  color: Color.fromARGB(255, 241, 227, 209),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: Container(
        height: 64,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 241, 227, 209),
          borderRadius: BorderRadius.circular(32),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navItem(
              context: context,
              icon: Icons.home,
              label: "Home",
              index: 0,
            ),
            _navItem(
              context: context,
              icon: Icons.store_outlined,
              label: "Stores",
              index: 1,
            ),
            _navItem(
              context: context,
              icon: Icons.favorite_border,
              label: "Wishlist",
              index: 2,
            ),
            _navItem(
              context: context,
              icon: Icons.receipt_long_outlined,
              label: "My Orders",
              index: 3,
            ),
            _navItem(
              context: context,
              icon: Icons.person_outline,
              label: "Profile",
              index: 4,
            ),
          ],
        ),
      ),
    );
  }
}







// import 'package:flutter/material.dart';

// class BottomNav extends StatelessWidget {
//   final int currentIndex;
//   final ValueChanged<int> onTap;

//   const BottomNav({
//     super.key,
//     required this.currentIndex,
//     required this.onTap,
//   });

//   Widget _navItem({
//     required IconData icon,
//     required String label,
//     required int index,
//   }) {
//     final bool active = currentIndex == index;

//     return GestureDetector(
//       behavior: HitTestBehavior.opaque,
//       onTap: () => onTap(index),

//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 250),
//         curve: Curves.easeOutCubic,
//         height: 44,
//         padding: EdgeInsets.symmetric(
//           horizontal: active ? 14 : 0,
//         ),
//         decoration: BoxDecoration(
//           color: active
//               ? const Color(0xFF2E2E2E)
//               : Colors.transparent,
//           borderRadius: BorderRadius.circular(22),
//         ),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Icon(
//               icon,
//               size: 22,
//               color: active
//                   ? const Color.fromARGB(255, 241, 227, 209)
//                   : const Color(0xFF232323),
//             ),

//             AnimatedSize(
//               duration: const Duration(milliseconds: 200),
//               curve: Curves.easeOut,
//               child: active
//                   ? Row(
//                       children: [
//                         const SizedBox(width: 6),
//                         Text(
//                           label,
//                           style: const TextStyle(
//                             color: Color.fromARGB(255, 241, 227, 209),
//                             fontSize: 13,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ],
//                     )
//                   : const SizedBox.shrink(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Padding(
//         padding: const EdgeInsets.all(14),
//         child: Container(
//           height: 64,
//           decoration: BoxDecoration(
//             color: const Color.fromARGB(255, 241, 227, 209),
//             borderRadius: BorderRadius.circular(32),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.08),
//                 blurRadius: 12,
//                 offset: const Offset(0, 6),
//               ),
//             ],
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               _navItem(icon: Icons.home, label: "Home", index: 0),
//               _navItem(icon: Icons.store_outlined, label: "Stores", index: 1),
//               _navItem(icon: Icons.favorite_border, label: "Wishlist", index: 2),
//               _navItem(icon: Icons.receipt_long_outlined, label: "My Orders", index: 3),
//               _navItem(icon: Icons.person_outline, label: "Profile", index: 4),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }




// import 'package:flutter/material.dart';

// class BottomNav extends StatelessWidget {
//   final int currentIndex;
//   final ValueChanged<int> onTap;

//   const BottomNav({
//     super.key,
//     required this.currentIndex,
//     required this.onTap,
//   });

//   Widget _item({
//     required IconData icon,
//     required String label,
//     required int index,
//   }) {
//     final bool active = currentIndex == index;

//     return GestureDetector(
//       onTap: () => onTap(index),
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 250),
//         curve: Curves.easeOutCubic,
//         height: 44,
//         padding: EdgeInsets.symmetric(horizontal: active ? 14 : 0),
//         decoration: BoxDecoration(
//           color: active ? const Color(0xFF2E2E2E) : Colors.transparent,
//           borderRadius: BorderRadius.circular(22),
//         ),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Icon(
//               icon,
//               size: 22,
//               color: active
//                   ? const Color.fromARGB(255, 241, 227, 209)
//                   : const Color(0xFF232323),
//             ),
//             if (active) ...[
//               const SizedBox(width: 6),
//               Text(
//                 label,
//                 style: const TextStyle(
//                   color: Color.fromARGB(255, 241, 227, 209),
//                   fontSize: 13,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ],
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Padding(
//         padding: const EdgeInsets.all(14),
//         child: Container(
//           height: 64,
//           decoration: BoxDecoration(
//             color: const Color.fromARGB(255, 241, 227, 209),
//             borderRadius: BorderRadius.circular(32),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.08),
//                 blurRadius: 12,
//                 offset: const Offset(0, 6),
//               ),
//             ],
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               _item(icon: Icons.home, label: 'Home', index: 0),
//               _item(icon: Icons.store_outlined, label: 'Stores', index: 1),
//               _item(icon: Icons.favorite_border, label: 'Wishlist', index: 2),
//               _item(icon: Icons.receipt_long_outlined, label: 'My Orders', index: 3),
//               _item(icon: Icons.person_outline, label: 'Profile', index: 4),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
