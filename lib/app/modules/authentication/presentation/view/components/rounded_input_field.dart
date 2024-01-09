import 'package:flutter/material.dart';
import 'package:image_convert/app/modules/authentication/presentation/view/components/text_field_container.dart';
import 'package:image_convert/app/shared/widgets/style/app_colors.dart';

class RoundedInputField extends StatelessWidget {
  final bool obscureText;
  final VoidCallback onTapVisibleText;
  final String? Function(String?)? validator;
  final Key? textFieldKey;
  final String hintText;
  final IconData? icon, suffixIcon;
  final void Function(String)? onChanged;
  final TextEditingController controller;
  const RoundedInputField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
    required this.size,
    this.suffixIcon,
    required this.controller,
    required this.textFieldKey,
    required this.validator,
    required this.onTapVisibleText,
    required this.obscureText,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFieldContainer(
        size: size,
        child: Form(
          key: textFieldKey,
          child: TextFormField(
            obscureText: obscureText,
            validator: validator,
            controller: controller,
            onChanged: onChanged,
            decoration: InputDecoration(
                hintText: hintText,
                icon: Icon(
                  icon,
                  color: AppColors.kPrimaryColor,
                ),
                border: InputBorder.none,
                suffixIcon: GestureDetector(
                    onTap: onTapVisibleText, child: Icon(suffixIcon))),
          ),
        ),
      ),
    );
  }
}
