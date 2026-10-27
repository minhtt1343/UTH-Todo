import 'package:flutter/material.dart';
import '../models/onboarding_model.dart';
import '../repositories/onboarding_repository.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  final OnboardingRepository _repository = OnboardingRepository();
  late List<OnboardingModel> _steps;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _steps = _repository.getOnboardingSteps(); // Đọc dữ liệu OOP
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("UTH Todo", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
        actions: [
          TextButton(
            onPressed: () => print("Bỏ qua"),
            child: const Text("Bỏ qua", style: TextStyle(color: Colors.grey, fontSize: 16)),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _steps.length,
              onPageChanged: (index) {
                setState(() => _currentPage = index);
              },
              itemBuilder: (context, index) {
                final step = _steps[index]; // Trích xuất dữ liệu từ object OOP
                return Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 70,
                        backgroundColor: Colors.blue.shade50,
                        child: Icon(
                          index == 0 ? Icons.all_inbox_rounded : index == 1 ? Icons.bubble_chart_rounded : Icons.notifications_active_rounded,
                          size: 70, 
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(height: 50),
                      Text(
                        step.title,
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        step.description,
                        style: const TextStyle(fontSize: 16, color: Colors.black54),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _steps.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                height: 8,
                width: _currentPage == index ? 24 : 8,
                decoration: BoxDecoration(
                  color: _currentPage == index ? Colors.blue : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  if (_currentPage < _steps.length - 1) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    print("Đăng nhập thành công / Vào trang chủ!");
                  }
                },
                child: Text(
                  _currentPage == _steps.length - 1 ? "Bắt đầu ngay" : "Tiếp tục",
                  style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
