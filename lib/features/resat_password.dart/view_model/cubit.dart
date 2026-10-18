import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply_app/features/resat_password.dart/repo/forgot_password_repo.dart';
import 'package:shoply_app/features/resat_password.dart/view_model/state.dart';

class CubitForgetPassowrd extends Cubit<ForgotPasswordState> {
  CubitForgetPassowrd() : super(ForgotInitState());

  final key = GlobalKey<FormState>();
  final emile = TextEditingController();
  final repo = ForgotPasswordRepo();

  Future<void> resetPassord() async {
    if (!(key.currentState?.validate() ?? false)) return;
    emit(ForgotLodingState());

    final result = await repo.forgotPassword(emile: emile.text.trim());
    if (isClosed) return;

    result.fold(
      (errorMessage) => emit(ForgotErorroState(errorMessage: errorMessage)),

      (_) => emit(
        ForgotSucsseState(
          successMessage: 'If this email is registered, a reset link was sent.',
        ),
      ),
    );
  }

  @override
  Future<void> close() {
    emile.dispose();
    return super.close();
  }
}
