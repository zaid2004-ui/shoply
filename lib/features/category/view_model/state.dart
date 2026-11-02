abstract class CtegoryState {}

class InitCategoryState extends CtegoryState {}

class LodingCategoryState extends CtegoryState {}

class ErroreCategoryState extends CtegoryState {
  final String errorMesage;

  ErroreCategoryState({required this.errorMesage});
}

class SucssesCategoryState extends CtegoryState {}
