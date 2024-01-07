import 'package:flutter/material.dart';
import 'package:image_convert/app/modules/splash/presentation/view/components/body.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // Future.delayed(
    //   const Duration(seconds: 3),
    //   () {
    //     Modular.to.pushNamed('/auth/');
    //   },
    // );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Body());
  }
}
