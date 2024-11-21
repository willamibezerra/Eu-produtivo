import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

import 'package:image_convert/app/shared/widgets/style/app_colors.dart';

class OnBoardingWidget extends StatelessWidget {
  const OnBoardingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
      controllerColor: AppColors.kPrimaryColor,
      pageBackgroundColor: Colors.white,
      onFinish: () {
        Modular.to.pushNamed('/auth/');
      },
      headerBackgroundColor: Colors.white,
      finishButtonText: 'Confirmar',
      finishButtonStyle: const FinishButtonStyle(
        backgroundColor: AppColors.kPrimaryColor,
      ),
      skipTextButton: const Text('Pular'),
      centerBackground: true,
      background: [
        Image.asset(
          'assets/images/delivery.png',
        ),
        Image.asset(
          'assets/images/working.png',
        ),
      ],
      totalPage: 2,
      speed: 1.8,
      pageBodies: const [
        BodyOnBoardingWidget(
          content: """
    Aqui, você terá as ferramentas e o foco necessários para alcançar suas metas e transformar planos em conquistas. Vamos juntos rumo à sua melhor versão! 🚀,
    """,
          title: 'Bem-Vindo',
        ),
        BodyOnBoardingWidget(title: 'Prepare-se', content: """
Você está a um passo de transformar sua rotina e alcançar suas metas. No Eu Produtivo, organização e foco se tornam parte do seu dia a dia. Vamos começar? 🚀
""")
      ],
    );
  }
}

class BodyOnBoardingWidget extends StatelessWidget {
  final String title;
  final String content;
  const BodyOnBoardingWidget({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Text(
            content,
            style: const TextStyle(color: Color(0xff888A8C), fontSize: 20),
          ),
        ],
      ),
    );
  }
}
