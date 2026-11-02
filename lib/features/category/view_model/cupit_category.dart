import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply_app/features/category/repo/repo_category.dart';
import 'package:shoply_app/features/category/view_model/state.dart';
import 'package:shoply_app/model/categories/response_category.dart';

class CupitCategory extends Cubit<CtegoryState> {
  CupitCategory() : super(InitCategoryState());
  final categoryRepo = RepoCategory();
  final List<ResponseCategory> responsCategory = [];

  Future<void> refreshCategory() async {
    responsCategory.clear();
    await getCategroy();
  }

  Future<void> getCategroy() async {
    emit(LodingCategoryState());
    final result = await categoryRepo.getCateglry();

    result.fold(
      (errorMessage) {
        emit(ErroreCategoryState(errorMesage: errorMessage));
      },
      (responsCategory) {
        this.responsCategory.addAll(responsCategory);
        emit(SucssesCategoryState());
      },
    );
  }
}
