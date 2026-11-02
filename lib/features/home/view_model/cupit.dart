import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply_app/features/home/repo/repo_home.dart';
import 'package:shoply_app/features/home/view_model/sate.dart';
import 'package:shoply_app/model/categories/response_category.dart';
import 'package:shoply_app/model/products/response_products.dart';
import 'package:shoply_app/model/sales/respons_sales.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitState());
  final List<ResponseCategory> responseCategory = [];
  final List<ResponsSales> responsSales = [];
  final List<ResponseProducts> responseProducts = [];

  String? errorMessage;

  Future<void> refreshHome() async {
    responsSales.clear();
    responseCategory.clear();
    responseProducts.clear();
    errorMessage = null;
    await getHome();
  }

  //get all process home
  Future<void> getHome() async {
    emit(HomeLodingState());
    await Future.wait([getCategory(), getSeals(), getTrendingProducts()]);
    if (errorMessage != null) {
      emit(HomeErorreState(errorState: errorMessage ?? ''));
    } else {
      emit(HomeSuccessState());
    }
  }

  //get category

  Future<void> getCategory() async {
    final result = await RepoHome().getCtegory();

    result.fold(
      (errorMessage) {
        this.errorMessage = errorMessage;
        emit(HomeErorreState(errorState: errorMessage));
      },
      (responseCategory) {
        this.responseCategory.addAll(responseCategory);
      },
    );
  }

  //get seals
  Future<void> getSeals() async {
    final result = await RepoHome().getSales();
    result.fold(
      (errorMessage) {
        this.errorMessage = errorMessage;
        emit(HomeErorreState(errorState: errorMessage));
      },
      (responsSales) {
        this.responsSales.addAll(responsSales);
      },
    );
  }

  //geat trinding products
  Future<void> getTrendingProducts() async {
    final result = await RepoHome().getTrendingProducts();
    result.fold(
      (errorMessage) {
        this.errorMessage = errorMessage;
      },
      (responseProducts) {
        this.responseProducts.addAll(responseProducts);
      },
    );
  }
}
