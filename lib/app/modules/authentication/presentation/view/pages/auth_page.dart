import 'package:flutter/material.dart';

import 'package:image_convert/app/modules/authentication/presentation/state/auth_controller.dart';
import 'package:image_convert/app/modules/authentication/presentation/view/components/body_login.dart';

class AuthPage extends StatefulWidget {
  final AuthController controller;
  const AuthPage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
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
