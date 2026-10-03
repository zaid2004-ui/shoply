import 'package:flutter/material.dart';

class CustomUsernameField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;

  const CustomUsernameField({super.key, required this.label, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
        ),
        labelText: label,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return null;
          // AppLocalizations.of(context)!.required_field;
        }

        return null;
      },
    );
  }
}
