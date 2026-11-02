import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply_app/core/local/local_storage.dart';
import 'package:shoply_app/core/local/local_storage_user.dart';
import 'package:shoply_app/features/home/view/home.dart';
import 'package:shoply_app/features/main/repo/repo_main.dart';
import 'package:shoply_app/features/main/view_model/state.dart';

class CubitMain extends Cubit<MainState> {
  CubitMain() : super(MainInitState());

  final repo = RepoMain();
  int navBarIndex = 0;

  int countCart = 0;
  List<Widget> page = [
    Home(),
    Center(child: Text('Favourite')),
    Center(child: Text('Cart')),
    Center(child: Text('Profile')),
  ];

  void changeNavBarIndex({required int index}) {
    navBarIndex = index;
    emit(MainChangeNavBarIndexState());
  }

  Future<void> getCartCount() async {
    final result = await repo.getCount();
    result.fold((_) {}, (cartCount) {
      countCart = cartCount;
      emit(MainChangeCartCountState());
    });
  }

  void decrementCartCount() {
    countCart--;
    emit(MainChangeCartCountState());
  }

  void removeCartCount() {
    countCart = 0;
    emit(MainChangeCartCountState());
  }

  Future<void> logout() async {
    await repo.logout();
    await LocalStorageUser.instens.clear();
    await LocalStorage.instens.setIsLogin(value: false);
  }
}
