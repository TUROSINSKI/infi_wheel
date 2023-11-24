import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infi_wheel/core/utils/colors.dart';
import 'package:infi_wheel/features/authentication/presentation/providers/onboarding_providers/onboarding_blocs.dart';
import 'package:infi_wheel/features/authentication/presentation/providers/onboarding_providers/onboarding_events.dart';
import 'package:infi_wheel/features/authentication/presentation/providers/onboarding_providers/onboarding_states.dart';
import 'package:infi_wheel/features/authentication/presentation/widgets/onboarding_widgets/background_custom_painter.dart';
import 'package:infi_wheel/features/authentication/presentation/widgets/onboarding_widgets/onboarding_large_text.dart';
import 'package:infi_wheel/features/authentication/presentation/widgets/onboarding_widgets/onboarding_slides.dart';
import 'package:infi_wheel/features/authentication/presentation/widgets/onboarding_widgets/onboarding_text.dart';
import 'package:infi_wheel/shared/widgets/go_next_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          "assets/icons/applogo.png",
          fit: BoxFit.cover,
          height: 150,
        ),
        backgroundColor: AppColors.kWhite,
      ),
      body: BlocBuilder<OnboardingBloc, OnboardingState>(
        builder: (context, state) {
          return Stack(children: <Widget>[
            CustomPaint(
              size: Size(double.infinity, double.infinity),
              painter: BackgroundPainter(),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 1 / 2,
              child: PageView.builder(
                  controller: context.read<OnboardingBloc>().pageController,
                  onPageChanged: (index) {
                    state.page = index;
                    BlocProvider.of<OnboardingBloc>(context)
                        .add(OnboardingEvent());
                  },
                  scrollDirection: Axis.vertical,
                  itemCount: 3,
                  itemBuilder: (_, index) {
                    return Container(
                      width: double.maxFinite,
                      height: double.maxFinite,
                      child: Container(
                        margin: const EdgeInsets.only(
                            top: 100, left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            OnboardinglargeText(text: "InfiWheel"),
                            OnboardingText(
                              text: onboardingTitle[index],
                              size: 24,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: 250,
                              child:
                                  OnboardingText(text: onboardingTexts[index]),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            // NextButton(width: 120,),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Positioned(
              top: 150,
              right: 20,
              child: Column(
                children: List.generate(3, (indexDots) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    margin: const EdgeInsets.only(bottom: 2),
                    width: 8,
                    height: state.page.toDouble() == indexDots ? 25 : 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: state.page.toDouble() == indexDots
                          ? AppColors.kOrangeWeb
                          : AppColors.kOrangeWeb.withOpacity(0.3),
                    ),
                  );
                }),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: GestureDetector(
                    onTap: () {}, child: NextButton(width: 120)),
              ),
            ),
          ]);
        },
      ),
    );
  }
}
