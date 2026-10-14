import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class CutomTextFiledPhon extends StatelessWidget {
  const CutomTextFiledPhon({super.key, required this.phoneCotroler});
  final TextEditingController phoneCotroler;

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: phoneCotroler,
      decoration: InputDecoration(
        labelText: 'Phone Number',
        border: OutlineInputBorder(borderSide: BorderSide()),
      ),
      initialCountryCode: 'JO',
      onChanged: (phone) {},
    );
  }
}
