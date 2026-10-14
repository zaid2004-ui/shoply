import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply_app/core/local/local_storage.dart';
import 'package:shoply_app/core/local/local_storage_user.dart';
import 'package:shoply_app/features/splash/view_model/state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitState());

  Future<void> goNextPage() async {
    await Future.delayed(const Duration(seconds: 4)); // مدة الأنيميشن
    if (isClosed) return;

    final storage = LocalStorage.instens;

    // ما شاف Onboarding ← Onboarding
    if (!storage.isShowOnboard) {
      emit(SplashOnBoardPageState());
      return;
    }

    // مسجّل دخول وجلسة Firebase موجودة ← Home، غير هيك ← Login
    final isLoggedIn =
        storage.isLogin && FirebaseAuth.instance.currentUser != null;

    if (isLoggedIn) {
      await LocalStorageUser.instens.loadUser();
      emit(SplashHomePageState());
    } else {
      await storage.setIsLogin(value: false);
      await LocalStorageUser.instens.clear();
      emit(SplashLoginPageState());
    }
  }
}
