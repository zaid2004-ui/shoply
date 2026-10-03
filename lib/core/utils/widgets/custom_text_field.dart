import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;

  const CustomTextField({super.key, required this.label, this.controller});

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
          // return AppLocalizations.of(context)!.required_field;
        }

        if (!RegExp(r'^.+\@.+\..+$').hasMatch(value)) {
          return null;
          //  AppLocalizations.of(context)!.invalid_email;
        }

        return null;
      },
    );
  }
}
