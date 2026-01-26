import 'dart:async';
import 'package:flutter/material.dart';

class ProductSlider extends StatefulWidget {
  final List<Map<String, String>> products;

  const ProductSlider({super.key, required this.products});

  @override
  State<ProductSlider> createState() => _ProductSliderState();
}

class _ProductSliderState extends State<ProductSlider>
    with SingleTickerProviderStateMixin {
  int current = 0;
  late PageController controller;
  Timer? timer;

  late AnimationController pulseController;
  late Animation<double> pulseAnimation;

  @override
  void initState() {
    super.initState();

    controller = PageController();

    timer = Timer.periodic(const Duration(seconds: 3), (_) {
      current = (current + 1) % widget.products.length;
      controller.animateToPage(
        current,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });

    pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);

    pulseAnimation = Tween<double>(begin: 1, end: 1.05).animate(
      CurvedAnimation(parent: pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    controller.dispose();
    pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: controller,
            itemCount: widget.products.length,
            onPageChanged: (i) => setState(() => current = i),
            itemBuilder: (_, i) => _card(widget.products[i]),
          ),
        ),

        const SizedBox(height: 10),

        /// 🔘 Indicator
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              widget.products.length,
              (i) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: current == i ? 18 : 6,
                height: 6,
                decoration: BoxDecoration(
                  color: current == i ? Colors.black : Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// 🧩 WAVY PROMO CARD
  Widget _card(Map<String, String> p) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: ClipPath(
        clipper: SmoothWaveClipper(),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF2F2F2),
            borderRadius: BorderRadius.circular(22),
          ),
          child: Stack(
            children: [
              /// 🖼 Product Image
              Positioned(
                right: 10,
                top: 0,
                bottom: 0,
                child: Image.asset(
                  p["image"]!,
                  width: 140,
                  fit: BoxFit.contain,
                ),
              ),

              /// 📝 Content
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 18, 120, 26),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        "Limited Offer",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    Text(
                      p["title"]!,
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 20,
                        height: 1.2,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 16),

                    ScaleTransition(
                      scale: pulseAnimation,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(26),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text(
                              "Shop Now",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 8),
                            CircleAvatar(
                              radius: 11,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.arrow_forward,
                                size: 14,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 🌊 IMAGE-MATCHING SMOOTH WAVE CLIPPER
class SmoothWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, size.height - 28);

    /// left → center smooth dip
    path.cubicTo(
      size.width * 0.25,
      size.height - 10,
      size.width * 0.35,
      size.height - 10,
      size.width * 0.5,
      size.height - 22,
    );

    /// center → right rise
    path.cubicTo(
      size.width * 0.65,
      size.height - 34,
      size.width * 0.85,
      size.height - 36,
      size.width,
      size.height - 18,
    );

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
