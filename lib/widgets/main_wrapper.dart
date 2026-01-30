// import 'package:flutter/material.dart';
// import 'package:zala/screens/home_screen.dart';
// import 'package:zala/screens/stores.dart';
// import 'package:zala/screens/wishlist.dart';
// import 'package:zala/screens/myorders.dart';
// import 'package:zala/screens/profile.dart';
// import 'package:zala/widgets/bottom_nav.dart';

// class MainWrapper extends StatefulWidget {
//   const MainWrapper({super.key});

//   @override
//   State<MainWrapper> createState() => _MainWrapperState();
// }

// class _MainWrapperState extends State<MainWrapper> {
//   int _currentIndex = 0;

//   final List<Widget> _screens = const [
//     HomeScreen(),
//     StoresScreen(),
//     WishlistScreen(),
//     MyOrdersScreen(),
//     ProfileScreen(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: IndexedStack(
//         index: _currentIndex,
//         children: _screens,
//       ),
//       bottomNavigationBar: BottomNav(
//         currentIndex: _currentIndex,
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart';   // ✅ HERE
import 'package:zala/screens/home_screen.dart';
import 'package:zala/screens/stores.dart';
import 'package:zala/screens/wishlist.dart';
import 'package:zala/screens/myorders.dart';
import 'package:zala/screens/profile.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    StoresScreen(),
    WishlistScreen(),
    MyOrdersScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNav(   // ✅ USED HERE
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
