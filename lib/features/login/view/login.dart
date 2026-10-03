import 'package:flutter/material.dart';
import 'package:shoply_app/features/login/widget/login_card.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // login process
  /*  Future<void> _login(BuildContext context) async {
    if (!globalKey.currentState!.validate()) {
      return;
    }

    try {
      await AuthServices().login(
        email: emailControler.text.trim(),
        password: passwordController.text.trim(),
      );

      if (!context.mounted) return;

      GeneralWidget().showSucessMessage(
        context,
        AppLocalizations.of(context)!.loginSuccess,
      );
      Duration(microseconds: 1);
      AppRouter.startNewRoute(Routes.home, args: {});
    } catch (e) {
      if (!context.mounted) return;

      GeneralWidget().showErrorMessage(context, '$e');
    }
  }*/

  final TextEditingController emailControler = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Form(
      key: globalKey,
      child: Scaffold(
        backgroundColor: colorScheme.primary,
        // يمنع Scaffold من تغيير حجم الـ body بسبب الكيبورد
        resizeToAvoidBottomInset: false,
        //login card widget
        body: Stack(
          children: [
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

            Center(
              child: LoginCard(
                passwordController: passwordController,
                emailControler: emailControler,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
