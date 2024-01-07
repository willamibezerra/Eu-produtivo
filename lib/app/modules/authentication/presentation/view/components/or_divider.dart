import 'package:flutter/material.dart';
import 'package:image_convert/app/shared/widgets/style/app_colors.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
      width: size.width * 0.8,
      child: const Row(
        children: [
          Expanded(
              child: Divider(
            color: Color(0xffD9D9D9),
            height: 1.5,
          )),
          SizedBox(
            width: 5,
          ),
          Text(
            'OU',
            style: TextStyle(
                color: AppColors.kPrimaryColor, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
              child: Divider(
            color: Color(0xffD9D9D9),
            height: 1.5,
          )),
        ],
      ),
    );
  }
}
