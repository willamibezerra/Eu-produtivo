import 'package:flutter/material.dart';
import 'package:image_convert/app/modules/splash/presentation/view/components/body.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
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
