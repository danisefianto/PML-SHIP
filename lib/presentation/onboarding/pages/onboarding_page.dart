import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../auth/pages/sign_in_page.dart';
import '../models/onboarding_model.dart';
import '../widgets/onboarding_content.dart';
import '../widgets/onboarding_indicator.dart';
import '../widgets/skip_button.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentPage = 0;
  final pageController = PageController();

  final onboardingData = [
    OnboardingModel(
      image: Assets.image.onboarding.imageSlide01.path,
      text:
          'Shop with ease and confidence - PT Patria Maritime Lines delivers your purchases directly to you',
    ),
    OnboardingModel(
      image: Assets.image.onboarding.imageSlide02.path,
      text:
          'Track your order in real-time and see it sailing smoothly towards you with PT Patria Maritime Lines.',
    ),
    OnboardingModel(
      image: Assets.image.onboarding.imageSlide03.path,
      text:
          'Sit back, relax, and enjoy your purchases delivered quickly and securely by PT Patria Maritime Lines.',
    ),
  ];

  void navigate() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const SignInPage()));
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 400.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.image.onboarding.imageOrnament.path),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Column(
            children: [
              SkipButton(onPressed: navigate),
              OnboardingContent(
                pageController: pageController,
                onPageChanged: (index) {
                  currentPage = index;
                  setState(() {});
                },
                contents: onboardingData,
              ),
              OnboardingIndicator(
                length: onboardingData.length,
                currentPage: currentPage,
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Button.filled(
                  onPressed: () {
                    if (currentPage < onboardingData.length - 1) {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                      currentPage++;
                      setState(() {});
                    } else {
                      navigate();
                    }
                  },
                  label: 'Continue',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
