import 'package:flutter/material.dart';
import 'package:image_convert/app/modules/authentication/presentation/state/auth_controller.dart';
import 'package:image_convert/app/modules/authentication/presentation/view/components/body_register_account.dart';

class RegisterAccountPage extends StatefulWidget {
  final AuthController controller;
  const RegisterAccountPage({super.key, required this.controller});

  @override
  State<RegisterAccountPage> createState() => _RegisterAccountPageState();
}

class _RegisterAccountPageState extends State<RegisterAccountPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BodyRegisterAccount(
        controller: widget.controller,
        size: size,
      ),
    );
  }
}
