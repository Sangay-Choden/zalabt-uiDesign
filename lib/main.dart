// import 'package:flutter/material.dart';
// import 'screens/landing_screen.dart';
// // import 'database/db_app.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   // 🔹 Initialize database (if needed later)
//   // final db = DBApp();
//   // await db.database;

//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Zala',
//       theme: ThemeData(
//         useMaterial3: true,
//         colorSchemeSeed: const Color(0xFF000000),
//         scaffoldBackgroundColor: Colors.white,
//       ),
//       home: const LandingScreen(),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'screens/landing_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zala',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF000000),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const LandingScreen(), // keep as is
    );
  }
}
