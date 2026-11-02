abstract class ProductsState {}

class InitStateProducts extends ProductsState {}

class LodingStateProducts extends ProductsState {}

class ErorregStateProducts extends ProductsState {
  final String errorMessage;

  ErorregStateProducts({required this.errorMessage});
}

class SucsesegStateProducts extends ProductsState {}
