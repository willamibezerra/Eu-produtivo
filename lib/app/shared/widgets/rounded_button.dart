import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_convert/app/shared/widgets/style/app_colors.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Color color, textcolor;
  final VoidCallback press;
  final Size size;
  final bool? isLoading;

  const RoundedButton({
    Key? key,
    this.textcolor = Colors.white,
    required this.press,
    required this.size,
    this.color = AppColors.kPrimaryColor,
    required this.text,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(color),
        ),
        onPressed: isLoading! ? null : press,
        child: isLoading!
            ? const Padding(
                padding: EdgeInsets.all(15),
                child: CircularProgressIndicator(color: Colors.white),
              )
            : Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                child: Text(
                  text,
                  style: TextStyle(color: textcolor),
                ),
              ),
      ),
    );
  }
}
