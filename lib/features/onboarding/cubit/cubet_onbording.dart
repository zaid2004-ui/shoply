import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply_app/features/onboarding/cubit/onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingState(count: 0));
  void changePage(int index) {
    emit(OnboardingState(count: index));
  }
}
