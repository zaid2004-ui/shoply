import 'package:flutter/material.dart';
import 'package:shoply_app/core/routes/app_pages.dart';

import 'package:shoply_app/core/routes/app_routes.dart';
import 'package:shoply_app/features/regester/widget/regester_card.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  /*
  // مهم: Future method لإنشاء UserModel
  Future<UserModel> setUser(UserCredential userCredential) async {
    return UserModel(
      uid: userCredential.user!.uid,
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      phone: phoneController.text.trim(),
      city: '',
      favorites: [],
      savedAddresses: [],
      role: 'customer',
      createdAt: DateTime.now(),
    );
  }
  */
  /*
  // مهم: Future method للتسجيل
  Future<void> register(BuildContext context) async {
    if (!globalKey.currentState!.validate()) {
      return;
    }

    try {
      if (passwordController.text != confirmPasswordController.text) {
        if (!context.mounted) return;

        GeneralWidget().showErrorMessage(
          context,
          AppLocalizations.of(context)!.password_match,
        );

        return;
      }

      final userCredential = await AuthServices().register(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      final user = await setUser(userCredential);

      await UserService().createUser(user);

      if (!context.mounted) return;

      GeneralWidget().showSucessMessage(
        context,
        AppLocalizations.of(context)!.registrationSuccess,
      );
    } catch (e) {
      debugPrint('REGISTER ERROR ---------------------: $e');

      if (!context.mounted) return;

      GeneralWidget().showErrorMessage(context, '$e');
    }
  }
*/
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();
    phoneController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.primary,

      body: Form(
        key: globalKey,

        child: Center(
          child: RegisterCard(
            nameController: nameController,
            emailController: emailController,
            phoneController: phoneController,
            passwordController: passwordController,
            confirmPasswordController: confirmPasswordController,
            onRegister: () {
              // register(context);
            },

            onGoogleRegister: () {
              // Google register logic
            },

            onLogin: () {
              AppRoutes.pushNamedAndRemoveUntil(AppPages.login, AppPages.login);
            },
          ),
        ),
      ),
    );
  }
}
