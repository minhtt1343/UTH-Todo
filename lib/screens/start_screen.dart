import 'package:flutter/material.dart';
import 'onboarding_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2196F3), // Màu xanh chủ đạo UTH
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.playlist_add_check_rounded, size: 100, color: Colors.white),
            const SizedBox(height: 20),
            const Text(
              "UTH Todo",
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const Text(
              "Việc học, việc nhà - gọn gàng mỗi ngày",
              style: TextStyle(fontSize: 16, color: Colors.white70),
            ),
            const SizedBox(height: 120),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
              onPressed: () {
                // Chuyển sang màn hình Onboarding (Navigation)
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const OnboardingScreen()),
                );
              },
              child: const Text("Phiên bản 2.1.0", style: TextStyle(color: Color(0xFF2196F3), fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
