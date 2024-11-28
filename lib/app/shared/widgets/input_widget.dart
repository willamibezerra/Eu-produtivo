import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final bool readOnly;
  final int? lines;
  final TextInputType? textTipe;
  final String? label;
  final bool obscureText;
  final bool? enabled;
  final String? placeholder;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Function()? onTap;
  final Function(String)? onChanged;
  final TextEditingController controller;
  final bool? autofocus;
  final Color borderColor;
  final String? Function(String?)? validator;

  const InputWidget({
    Key? key,
    this.placeholder,
    this.label,
    this.lines = 1,
    this.suffixIcon,
    this.prefixIcon,
    this.enabled,
    this.onTap,
    this.textTipe,
    this.obscureText = false,
    this.onChanged,
    this.autofocus = false,
    this.borderColor = Colors.black,
    required this.controller,
    this.readOnly = false,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      maxLines: lines,
      keyboardType: textTipe,
      autovalidateMode: validator != null ? AutovalidateMode.always : null,
      validator: validator,
      cursorColor: Colors.amber,
      onTap: onTap,
      obscureText: obscureText,
      onChanged: onChanged,
      controller: controller,
      readOnly: readOnly,
      autofocus: autofocus ?? false,
      style: const TextStyle(height: 0.85, fontSize: 14.0, color: Colors.grey),
      textAlignVertical: const TextAlignVertical(y: 0.6),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintStyle: const TextStyle(
          color: Colors.amber,
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
                color: borderColor, width: 1.0, style: BorderStyle.solid)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: BorderSide(
                color: borderColor, width: 1.0, style: BorderStyle.solid)),
        hintText: placeholder,
        labelText: label,
        labelStyle: const TextStyle(color: Colors.black),
      ),
    );
  }
}
