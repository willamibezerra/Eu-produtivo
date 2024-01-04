import 'package:flutter/material.dart';
import 'package:image_convert/app/shared/widgets/style/app_colors.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Color color, textcolor;
  final VoidCallback press;
  const RoundedButton(
      {Key? key,
      this.textcolor = Colors.white,
      required this.press,
      required this.size,
      this.color = AppColors.kPrimaryColor,
      required this.text})
      : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(color)),
        onPressed: press,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          child: Text(
            text,
            style: TextStyle(color: textcolor),
          ),
        ),
      ),
    );
  }
}
