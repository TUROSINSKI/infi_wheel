import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infi_wheel/features/login_signup_onboard/presentation/providers/onboarding_providers/onboarding_events.dart';
import 'package:infi_wheel/features/login_signup_onboard/presentation/providers/onboarding_providers/onboarding_states.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState>{
  OnboardingBloc():super(OnboardingState()){
    on<OnboardingEvent>((event, emit){
      emit(OnboardingState(page: state.page));
    });
  }
}