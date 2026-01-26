import 'package:flutter/material.dart';

class HamMenu extends StatefulWidget {
  const HamMenu({super.key});

  @override
  State<HamMenu> createState() => _HamMenuState();
}

class _HamMenuState extends State<HamMenu> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  int selectedIndex = 0;

  final List<MenuItem> menuItems = [
    MenuItem("Home", Icons.home_outlined),
    MenuItem("Stores", Icons.store_outlined),
    MenuItem("Wishlist", Icons.favorite_border),
    MenuItem("My Orders", Icons.receipt_long_outlined),
    MenuItem("Profile", Icons.person_outline),
    MenuItem("Feedback", Icons.feedback_outlined),
    MenuItem("Contact Us", Icons.support_agent_outlined),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void onMenuTap(int index) {
    setState(() {
      selectedIndex = index;
    });

    print("Tapped: ${menuItems[index].title}");
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.45),
      body: Row(
        children: [
          SlideTransition(
            position: _offsetAnimation,
            child: Container(
              width: 290,
              height: height,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.horizontal(
                  right: Radius.circular(28),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.12),
                    blurRadius: 20,
                    offset: const Offset(4, 0),
                  ),
                ],
              ),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ===== Profile Section =====
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage("assets/profile.jpg"),
                          ),
                          const SizedBox(width: 14),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Bradon Lee",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "View profile",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey.shade600,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),

                    Divider(color: Colors.grey.shade200, thickness: 1),

                    // ===== Menu Items =====
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        itemCount: menuItems.length,
                        itemBuilder: (context, index) {
                          final item = menuItems[index];
                          final isSelected = index == selectedIndex;

                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 4),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(14),
                              onTap: () => onMenuTap(index),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 14, vertical: 12),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? const Color(0xFFEAF2FF)
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Row(
                                  children: [
                                    if (isSelected)
                                      Container(
                                        width: 4,
                                        height: 24,
                                        margin:
                                            const EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(
                                          color: Color(0xFF3A1212),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                      ),

                                    Icon(
                                      item.icon,
                                      size: 22,
                                      color: isSelected
                                          ? const Color.fromARGB(255, 109, 171, 222)
                                          : Colors.black87,
                                    ),
                                    const SizedBox(width: 16),
                                    Text(
                                      item.title,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: isSelected
                                            ? const Color.fromARGB(255, 109, 171, 222)
                                            : Colors.black87,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    Divider(color: Colors.grey.shade200),

                    // ===== Logout =====
                    InkWell(
                      onTap: () => print("Logout tapped"),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: const [
                            Icon(Icons.logout, size: 22, color: Color(0xFF3A1212)),
                            SizedBox(width: 16),
                            Text(
                              "Log out",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF3A1212),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Tap outside
          Expanded(
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(color: Colors.transparent),
            ),
          ),
        ],
      ),
    );
  }
}

class MenuItem {
  final String title;
  final IconData icon;

  MenuItem(this.title, this.icon);
}






// import 'package:flutter/material.dart';

// class HamMenu extends StatefulWidget {
//   const HamMenu({super.key});

//   @override
//   State<HamMenu> createState() => _HamMenuState();
// }

// class _HamMenuState extends State<HamMenu> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<Offset> _offsetAnimation;

//   int selectedIndex = 0;

//   // ✅ ONLY UPDATED: added extra menu items
//   final List<MenuItem> menuItems = [
//     MenuItem("Home", Icons.home_outlined),
//     MenuItem("Stores", Icons.store_outlined),
//     MenuItem("Wishlist", Icons.favorite_border),
//     MenuItem("My Orders", Icons.receipt_long_outlined),
//     MenuItem("Profile", Icons.person_outline),
//     MenuItem("Feedback", Icons.feedback_outlined),
//     MenuItem("Order Tracking", Icons.track_changes_outlined),
//     MenuItem("Contact Us", Icons.support_agent_outlined),
//     MenuItem("About Us", Icons.format_quote_outlined),
//     MenuItem("Order Scan", Icons.qr_code_scanner_outlined),
//     MenuItem("Product Scan", Icons.document_scanner_outlined),
//     MenuItem("Admin", Icons.admin_panel_settings_outlined),
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 300),
//     );

//     _offsetAnimation = Tween<Offset>(
//       begin: const Offset(-1.0, 0.0),
//       end: Offset.zero,
//     ).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
//     );

//     _controller.forward();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   void onMenuTap(int index) {
//     setState(() {
//       selectedIndex = index;
//     });

//     print("Tapped: ${menuItems[index].title}");
//   }

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;

//     return Scaffold(
//       backgroundColor: Colors.black.withOpacity(0.45),
//       body: Row(
//         children: [
//           SlideTransition(
//             position: _offsetAnimation,
//             child: Container(
//               width: 290,
//               height: height,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: const BorderRadius.horizontal(
//                   right: Radius.circular(28),
//                 ),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.12),
//                     blurRadius: 20,
//                     offset: const Offset(4, 0),
//                   ),
//                 ],
//               ),
//               child: SafeArea(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // ===== Profile Section =====
//                     Padding(
//                       padding: const EdgeInsets.all(20),
//                       child: Row(
//                         children: [
//                           const CircleAvatar(
//                             radius: 30,
//                             backgroundImage: AssetImage("assets/profile.jpg"),
//                           ),
//                           const SizedBox(width: 14),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               const Text(
//                                 "Bradon Lee",
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.w700,
//                                   fontSize: 17,
//                                 ),
//                               ),
//                               const SizedBox(height: 4),
//                               Text(
//                                 "View profile",
//                                 style: TextStyle(
//                                   fontSize: 13,
//                                   color: Colors.grey.shade600,
//                                 ),
//                               )
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),

//                     Divider(color: Colors.grey.shade200, thickness: 1),

//                     // ===== Menu Items =====
//                     Expanded(
//                       child: ListView.builder(
//                         padding: const EdgeInsets.symmetric(vertical: 10),
//                         itemCount: menuItems.length,
//                         itemBuilder: (context, index) {
//                           final item = menuItems[index];
//                           final isSelected = index == selectedIndex;

//                           return Padding(
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 14, vertical: 4),
//                             child: InkWell(
//                               borderRadius: BorderRadius.circular(14),
//                               onTap: () => onMenuTap(index),
//                               child: AnimatedContainer(
//                                 duration: const Duration(milliseconds: 200),
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 14, vertical: 12),
//                                 decoration: BoxDecoration(
//                                   color: isSelected
//                                       ? const Color(0xFFEAF2FF)
//                                       : Colors.transparent,
//                                   borderRadius: BorderRadius.circular(14),
//                                 ),
//                                 child: Row(
//                                   children: [
//                                     if (isSelected)
//                                       Container(
//                                         width: 4,
//                                         height: 24,
//                                         margin:
//                                             const EdgeInsets.only(right: 10),
//                                         decoration: BoxDecoration(
//                                           color: const Color(0xFF3A1212),
//                                           borderRadius:
//                                               BorderRadius.circular(4),
//                                         ),
//                                       ),
//                                     Icon(
//                                       item.icon,
//                                       size: 22,
//                                       color: isSelected
//                                           ? const Color.fromARGB(
//                                               255, 109, 171, 222)
//                                           : Colors.black87,
//                                     ),
//                                     const SizedBox(width: 16),
//                                     Text(
//                                       item.title,
//                                       style: TextStyle(
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.w500,
//                                         color: isSelected
//                                             ? const Color.fromARGB(
//                                                 255, 109, 171, 222)
//                                             : Colors.black87,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),

//                     Divider(color: Colors.grey.shade200),

//                     // ===== Logout =====
//                     InkWell(
//                       onTap: () => print("Logout tapped"),
//                       child: Padding(
//                         padding: const EdgeInsets.all(20),
//                         child: Row(
//                           children: const [
//                             Icon(Icons.logout,
//                                 size: 22, color: Color(0xFF3A1212)),
//                             SizedBox(width: 16),
//                             Text(
//                               "Log out",
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.w600,
//                                 color: Color(0xFF3A1212),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),

//           // Tap outside
//           Expanded(
//             child: GestureDetector(
//               onTap: () => Navigator.pop(context),
//               child: Container(color: Colors.transparent),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class MenuItem {
//   final String title;
//   final IconData icon;

//   MenuItem(this.title, this.icon);
// }
