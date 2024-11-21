import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:image_convert/app/modules/on_boarding/presentation/view/widgets/on_boarding_widget.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return const OnBoardingWidget();
  }
}
