import 'package:flutter/material.dart';

import 'package:image_convert/app/modules/authentication/presentation/state/auth_controller.dart';
import 'package:image_convert/app/modules/authentication/presentation/view/components/body_login.dart';

class LoginPage extends StatefulWidget {
  final AuthController controller;
  const LoginPage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BodyLogin(
        controller: widget.controller,
        size: size,
      ),
    );
  }
}


   //Modular.to.pushNamed('/auth /register');
