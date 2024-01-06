import 'package:flutter/material.dart';
import 'package:image_convert/app/shared/widgets/style/app_colors.dart';

class TextFieldContainer extends StatelessWidget {
  final Size size;
  final Widget child;
  const TextFieldContainer({
    Key? key,
    required this.size,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: AppColors.kPrimaryLiggtColor,
        borderRadius: BorderRadius.circular(29),
      ),
      child: Center(child: child),
    );
  }
}
