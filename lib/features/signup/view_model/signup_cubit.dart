import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply_app/features/signup/repo/signup_repo.dart';
import 'package:shoply_app/features/signup/view_model/state.dart';
import 'package:shoply_app/model/signup/request_signup.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitState());
  final _signupRepo = SignupRepo();
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future<void> signup() async {
    if (!(formKey.currentState?.validate() ?? false)) return;
    emit(SignupLoadingState());

    final result = await _signupRepo.signup(
      password: passwordController.text.trim(),
      requestSignup: RequestSignup(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        phone: phoneController.text.trim(),
      ),
    );
    if (isClosed) return;

    result.fold(
      (errorMessage) => emit(SignupErrorState(errorMessage: errorMessage)),
      (_) => emit(
        SignupSuccessState(
          successMessage:
              'Account created. Check your email to verify it, then log in.',
        ),
      ),
    );
  }

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
}
