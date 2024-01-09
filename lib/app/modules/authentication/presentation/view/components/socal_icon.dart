import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_convert/app/shared/widgets/style/app_colors.dart';

class SocalIcon extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTap;
  final bool isSvg;
  const SocalIcon({
    Key? key,
    required this.imagePath,
    required this.onTap,
    required this.isSvg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: AppColors.kPrimaryColor),
          shape: BoxShape.circle),
      child: GestureDetector(
          onTap: onTap,
          child: isSvg
              ? SvgPicture.asset(
                  imagePath,
                  height: 20,
                  width: 20,
                )
              : Image.asset(
                  imagePath,
                  height: 20,
                  width: 20,
                )),
    );
  }
}
