abstract class HomeState {}

class HomeInitState extends HomeState {}

class HomeLodingState extends HomeState {}

class HomeErorreState extends HomeState {
  final String errorState;

  HomeErorreState({required this.errorState, errorMessage});
}

class HomeSuccessState extends HomeState {}
