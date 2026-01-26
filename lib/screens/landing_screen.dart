import 'package:flutter/material.dart';
import 'home_screen.dart';

class LandingScreen extends StatelessWidget {// Landing screen widget displayed when the app is launched
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {// Build method to define the UI of the landing screen
    return Scaffold(// Scaffold provides the basic material design visual layout structure
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(// SafeArea widget to avoid system UI intrusions
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),// horizontal padding for the content
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,// center the content vertically
            children: [// children widgets of the column
              // ---------------- IMAGE ----------------
              Image.asset(
                'assets/zala.png', // add your image here
                height: 230,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 40),// spacing between image and title

              // ---------------- TITLE ----------------
              const Text(
                "Welcome to Zala",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 6),

              // ---------------- SUBTITLE ----------------
              const Text(
                "Your one-stop shop for all your needs",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),

              const SizedBox(height: 40),

              // ---------------- BUTTON ----------------
              SizedBox(// to make button full width
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 84, 54, 47),
                    foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {//its a functilon to navigate to home screen
                    Navigator.pushReplacement(// pushReplacement removes the current screen from the stack
                      context,
                      MaterialPageRoute(
                        builder: (_) => const HomeScreen(),
                      ),
                    );
                  },
                  child: const Text(// button text
                    "Get Started",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


