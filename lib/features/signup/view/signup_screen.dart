import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply_app/core/routes/app_pages.dart';
import 'package:shoply_app/core/routes/app_routes.dart';
import 'package:shoply_app/core/utils/widgets/snack_bar_helper.dart';
import 'package:shoply_app/core/utils/widgets/custom_loading.dart';
import 'package:shoply_app/features/signup/view/widget/regester_card.dart';
import 'package:shoply_app/features/signup/view_model/signup_cubit.dart';
import 'package:shoply_app/features/signup/view_model/state.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //bolcprovider
    return BlocProvider(
      create: (_) => SignupCubit(),
      //bloclistner
      child: BlocListener<SignupCubit, SignupState>(
        listener: (context, state) {
          //state bolclistener
          if (state is SignupLoadingState) {
            CustomLoading.show(context);
          } else if (state is SignupErrorState) {
            CustomLoading.hide(context);
            SnackBarHelper.showError(context, state.errorMessage);
          } else if (state is SignupSuccessState) {
            CustomLoading.hide(context);
            SnackBarHelper.showSuccess(context, state.successMessage);
            AppRoutes.startNewRoute(AppPages.login);
          }
        },
        child: Builder(
          builder: (context) {
            final cubit = context.read<SignupCubit>();
            return Scaffold(
              backgroundColor: Theme.of(context).colorScheme.primary,
              body: Form(
                key: cubit.formKey,
                child: Center(
                  child: RegisterCard(
                    nameController: cubit.nameController,
                    emailController: cubit.emailController,
                    phoneController: cubit.phoneController,
                    passwordController: cubit.passwordController,
                    confirmPasswordController: cubit.confirmPasswordController,
                    onRegister: cubit.signup,
                    onGoogleRegister: () {},
                    onLogin: () => AppRoutes.startNewRoute(AppPages.login),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
