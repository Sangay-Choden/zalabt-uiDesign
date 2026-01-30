// import 'package:flutter/material.dart';
// import 'home_screen.dart';

// class LandingScreen extends StatelessWidget {// Landing screen widget displayed when the app is launched
//   const LandingScreen({super.key});

//   @override
//   Widget build(BuildContext context) {// Build method to define the UI of the landing screen
//     return Scaffold(// Scaffold provides the basic material design visual layout structure
//       backgroundColor: const Color.fromARGB(255, 255, 255, 255),
//       body: SafeArea(// SafeArea widget to avoid system UI intrusions
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24),// horizontal padding for the content
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,// center the content vertically
//             children: [// children widgets of the column
//               // ---------------- IMAGE ----------------
//               Image.asset(
//                 'assets/zala.png', // add your image here
//                 height: 230,
//                 fit: BoxFit.contain,
//               ),

//               const SizedBox(height: 40),// spacing between image and title

//               // ---------------- TITLE ----------------
//               const Text(
//                 "Welcome to Zala",
//                 style: TextStyle(
//                   fontSize: 32,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),

//               const SizedBox(height: 6),

//               // ---------------- SUBTITLE ----------------
//               const Text(
//                 "Your one-stop shop for all your needs",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Colors.black54,
//                 ),
//               ),

//               const SizedBox(height: 40),

//               // ---------------- BUTTON ----------------
//               SizedBox(// to make button full width
//                 width: double.infinity,
//                 height: 54,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color.fromARGB(255, 84, 54, 47),
//                     foregroundColor: const Color.fromARGB(255, 255, 255, 255),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                   ),
//                   onPressed: () {//its a functilon to navigate to home screen
//                     Navigator.pushReplacement(// pushReplacement removes the current screen from the stack
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) => const HomeScreen(),
//                       ),
//                     );
//                   },
//                   child: const Text(// button text
//                     "Get Started",
//                     style: TextStyle(fontSize: 18),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'home_screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fade;
  late Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _fade = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );

    _slide = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final screenHeight = constraints.maxHeight;

            return Stack(
              children: [
                // ---------- BACKGROUND IMAGE ----------
                Image.asset(
                  'assets/bg.jpg',
                  height: screenHeight * 0.5,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

                // ---------- CENTER CIRCULAR LOGO ----------
                Positioned(
                  top: screenHeight * 0.43,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(14),
                        child: Image.asset(
                          'assets/zala.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),

                // ---------- SCROLLABLE CONTENT ----------
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(height: screenHeight * 0.5),
                      const SizedBox(height: 55),

                      FadeTransition(
                        opacity: _fade,
                        child: SlideTransition(
                          position: _slide,
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 24),
                            padding:
                                const EdgeInsets.fromLTRB(24, 52, 24, 28),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(26),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.12),
                                  blurRadius: 30,
                                  offset: const Offset(0, 14),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                const Text(
                                  "Welcome to Zala.bt",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),

                                const SizedBox(height: 12),

                                const Text(
                                  "Your go-to destination for smart, fast, and hassle-free shopping",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 15,
                                    height: 1.5,
                                    color: Colors.black54,
                                  ),
                                ),

                                const SizedBox(height: 28),

                                SizedBox(
                                  width: double.infinity,
                                  height: 54,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color.fromARGB(255, 246, 235, 221),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16),
                                      ),
                                      elevation: 6,
                                    ),
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) =>
                                              const HomeScreen(),
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      "Get Started",
                                      style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromARGB(255, 62, 47, 35),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
