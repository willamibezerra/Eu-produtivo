import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:image_convert/app/modules/splash/presentation/view/components/background.dart';
import 'package:image_convert/app/shared/widgets/rounded_button.dart';
import 'package:image_convert/app/shared/widgets/style/app_colors.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      size: size,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Bem-vindo ao Image Converter',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            SvgPicture.asset(
              'assets/icons/chat.svg',
              height: size.height * 0.45,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RoundedButton(
              size: size,
              press: () {
                Modular.to.pushNamed('/auth/');
              },
              text: 'LOGIN',
            ),
            RoundedButton(
              color: AppColors.kPrimaryLiggtColor,
              textcolor: Colors.black,
              size: size,
              press: () {},
              text: 'SIGN UP',
            )
          ],
        ),
      ),
    );
  }
}
