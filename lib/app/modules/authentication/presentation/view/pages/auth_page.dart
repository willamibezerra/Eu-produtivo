import 'package:flutter/material.dart';

import 'package:image_convert/app/modules/authentication/presentation/state/auth_controller.dart';
import 'package:image_convert/app/modules/authentication/presentation/view/components/body_login.dart';
import 'package:image_convert/app/modules/splash/presentation/view/state/controller/register_user_controller.dart';

class AuthPage extends StatefulWidget {
  final AuthController controller;
  final RegisterUserController registerUserController;

  const AuthPage({
    Key? key,
    required this.controller,
    required this.registerUserController,
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
        registerUserController: widget.registerUserController,
      ),
    );
  }
}
