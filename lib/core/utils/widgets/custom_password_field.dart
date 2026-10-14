import 'package:flutter/material.dart';

class CustomPasswordField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final String? Function(String?)? valedat;

  const CustomPasswordField({
    super.key,
    required this.label,
    this.controller,
    this.valedat,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: true,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
        ),
        labelText: label,
      ),
      validator: valedat,
    );
  }
}
