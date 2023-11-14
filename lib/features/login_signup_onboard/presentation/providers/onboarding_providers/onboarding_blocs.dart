import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infi_wheel/features/login_signup_onboard/presentation/providers/onboarding_providers/onboarding_events.dart';
import 'package:infi_wheel/features/login_signup_onboard/presentation/providers/onboarding_providers/onboarding_states.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final PageController pageController = PageController();
  OnboardingBloc() : super(OnboardingState()) {
    on<OnboardingEvent>((event, emit) {
      pageController.animateToPage(state.page,
          duration: Duration(milliseconds: 500), curve: Curves.elasticOut);
      emit(OnboardingState(page: state.page));
    });
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
