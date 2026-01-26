// import 'package:flutter/material.dart';
// // import 'screens/home_screen.dart';
// import 'screens/landing_screen.dart';
// // import 'database/db_app.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();// Ensures Flutter bindings are initialized before running the app
//   //binding is necessary when we have async code in main

//   // Initialize database without deleting existing data
//   // final db = DBApp();//This ensures that the database is ready and any existing data is not lost
//   // await db.database; // Ensures DB is ready before running app

//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {// Root widget of the application, setting up theme and initial screen
//   const MyApp({super.key});// Constructor 

//   @override
//   Widget build(BuildContext context) {// Build method to define the UI
//     return MaterialApp(// materialapp is a widget that introduces a number of widgets
//       debugShowCheckedModeBanner: false,// removes the debug banner
//       title: 'zala',// title of the app
//       theme: ThemeData(// defining the theme of the app
//         useMaterial3: true,
//         colorSchemeSeed: const Color.fromARGB(255, 255, 255, 255),
//       ),
//       home: const LandingScreen(), // First screen to load 
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'screens/landing_screen.dart';
// import 'database/db_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 🔹 Initialize database (if needed later)
  // final db = DBApp();
  // await db.database;

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
      home: const LandingScreen(),
    );
  }
}
