import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply_app/core/local/local_storage.dart';
import 'package:shoply_app/core/local/local_storage_user.dart';
import 'package:shoply_app/features/login/repo/login_repo.dart';
import 'package:shoply_app/features/login/view_model/state.dart';
import 'package:shoply_app/model/login/request_login.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(InitStateLogin());

  final key = GlobalKey<FormState>();
  final TextEditingController emile = TextEditingController();
  final TextEditingController password = TextEditingController();

  Future<void> login() async {
    if (!(key.currentState?.validate() ?? false)) return;
    emit(LodingStateLogin());

    final result = await LoginRepo().login(
      requestLogin: RequestLogin(
        email: emile.text.trim(),
        password: password.text.trim(),
      ),
    );
    if (isClosed) return;
    await result.fold(
      (errorMessage) async {
        emit(ErorrSstateLogin(errorMessage: errorMessage));
      },
      (user) async {
        await LocalStorageUser.instens.saveUser(user);
        await LocalStorage.instens.setIsLogin(value: true);
        if (!isClosed) emit(SucssStateLogin());
      },
    );
  }

  @override
  Future<void> close() {
    emile.dispose();
    password.dispose();
    return super.close();
  }
}
