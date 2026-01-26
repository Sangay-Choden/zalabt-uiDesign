import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/bottom_nav.dart';
import 'package:lucide_flutter/lucide_flutter.dart'; // for icons

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample user details
    const String name = "zala zala";
    const String email = "zala@gmail.com";
    const String phone = "+975 17890384";
    const String location = " olakha, Thimphu, Bhutan";
    const String address = "olakha, Thimphu, Bhutan";

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: "Profile"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Image
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/profile.jpg"), // placeholder
            ),
            const SizedBox(height: 12),
            Text(
              name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              email,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              phone,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),

            // Account details / Personal info card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _infoRow("Full Name", name, icon: Icons.person_outline),
                  const Divider(),
                  _infoRow("Email", email, icon: Icons.email_outlined),
                  const Divider(),
                  _infoRow("Phone", phone, icon: Icons.phone_outlined),
                  const Divider(),
                  _infoRow("Location", location, icon: Icons.location_on_outlined),
                  const Divider(),
                  _infoRow("Address", address, icon: Icons.home_outlined),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Other Options like Password, Saved Cards, etc.
            _optionRow("Password", "Change your password", icon: Icons.lock_outline),
            _optionRow("Saved Cards", "See your saved cards", icon: Icons.credit_card_outlined),
            _optionRow("Transfer PIN", "Change your transfer PIN", icon: Icons.pin_outlined),
            _optionRow("Refer & Earn", "Refer your friends and win rewards", icon: Icons.card_giftcard), // FIXED
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(
        currentIndex: 4, // highlight profile
        onTap: (_) {},
      ),
    );
  }

  // ================= INFO ROW =================
  Widget _infoRow(String title, String value, {IconData? icon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          if (icon != null)
            Icon(icon, size: 20, color: Colors.grey),
          if (icon != null) const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    )),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ================= OPTION ROW =================
  Widget _optionRow(String title, String subtitle, {IconData? icon}) {
    return GestureDetector(
      onTap: () {
        // handle tap
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            if (icon != null) Icon(icon, size: 20, color: Colors.grey),
            if (icon != null) const SizedBox(width: 12),
            Expanded( // prevents overflow
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      )),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                    overflow: TextOverflow.ellipsis, // safe for long text
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
