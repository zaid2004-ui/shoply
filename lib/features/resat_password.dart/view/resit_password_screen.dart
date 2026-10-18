import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply_app/core/routes/app_pages.dart';
import 'package:shoply_app/core/routes/app_routes.dart';
import 'package:shoply_app/core/utils/widgets/custom_loading.dart';
import 'package:shoply_app/core/utils/widgets/snack_bar_helper.dart';
import 'package:shoply_app/features/resat_password.dart/view/widget/resat_password_card.dart';
import 'package:shoply_app/features/resat_password.dart/view_model/cubit.dart';
import 'package:shoply_app/features/resat_password.dart/view_model/state.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CubitForgetPassowrd(),

      child: BlocListener<CubitForgetPassowrd, ForgotPasswordState>(
        listener: (context, state) {
          if (state is ForgotLodingState) {
            CustomLoading.show(context);
          } else if (state is ForgotErorroState) {
            CustomLoading.hide(context);
            SnackBarHelper.showError(context, state.errorMessage);
          } else if (state is ForgotSucsseState) {
            CustomLoading.hide(context);
            SnackBarHelper.showSuccess(context, state.successMessage);
            AppRoutes.pushNamed(AppPages.login);
          }
        },
        child: Builder(
          builder: (BuildContext context) {
            final cubit = context.read<CubitForgetPassowrd>();
            final colorScheme = Theme.of(context).colorScheme;

            return Scaffold(
              backgroundColor: colorScheme.primary,
              resizeToAvoidBottomInset: false,
              body: SafeArea(
                child: Stack(
                  children: [
                    // =========================
                    // Background circle - bottom left
                    // =========================
                    Positioned(
                      top: 500,
                      left: -150,
                      child: Container(
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                          color: colorScheme.onPrimary.withAlpha(30),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),

                    // =========================
                    // Background circle - top right
                    // =========================
                    Positioned(
                      top: 50,
                      right: -150,
                      child: Container(
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                          color: colorScheme.onPrimary.withAlpha(30),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),

                    // =========================
                    // Reset Password Card
                    // =========================
                    Form(
                      key: cubit.key,
                      child: Center(
                        child: ResetPasswordCard(
                          emailControler: cubit.emile,
                          onRest: cubit.resetPassord,
                        ),
                      ),
                    ),

                    // =========================
                    // Logo
                    // =========================
                    // Positioned(
                    //   top: 200,
                    //   left: 0,
                    //   right: 0,
                    //   child: Center(
                    //     child: Image.asset(
                    //       AppImages.shoplySplashImage,
                    //       width: 100,
                    //       height: 100,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
