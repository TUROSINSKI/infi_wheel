import 'package:flutter/material.dart';
import 'package:infi_wheel/features/login_signup/presentation/ui/widget/onboarding_large_text.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 3,
        itemBuilder: (_, index){
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Container(
              margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
              child: Row(
                children: [
                  Column(
                    children: [
                      OnboardinglargeText(text: "InfiWheel")
                    ],
                  )
                ],
              ),
            ),
          );
      }),
    );
  }
}