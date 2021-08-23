import 'package:flutter/material.dart';


class TTextFormField extends StatelessWidget {
  TTextFormField({
    Key? key,
    this.onChanged,
    required this.iconData,
    required this.text,
    this.obscureText = false,
    this.keyboardType,
    this.controller,
    this.validator,
  }) : super(key: key);

  final ValueChanged<String>? onChanged;
  final IconData iconData;
  final String text;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: BorderSide.none,
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        focusedBorder: border,
        border: border,
        prefixIcon: Icon(iconData, color: Color(0xFF2A3736)),
        hintStyle: TextStyle(
          fontSize: 18,
          color: Color(0xFF2A3736),
        ),
        filled: true,
        fillColor: Color(0xFF2A3736).withOpacity(0.1),
        hintText: text,
        labelText: text,
      ),
    );
  }
}
