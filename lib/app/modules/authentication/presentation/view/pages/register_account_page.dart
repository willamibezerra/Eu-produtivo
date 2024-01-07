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
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: BodyRegisterAccount(
      size: size,
    ));
  }
}

    // SizedBox(
            //   width: double.maxFinite,
            //   height: 50,
            //   child: ElevatedButton(
            //     onPressed: () {
            //       widget.controller.createAccount(
            //           email: _emailController.text,
            //           password: _passwordController.text);
            //     },
            //     child: const Text('Entrar'),
            //   ),
            // ),
            // Observer(
            //   builder: (context) {
            //     if (widget.controller.createAccountSucess != null) {
            //       if (widget.controller.createAccountSucess!) {
            //         return const Text('suceso');
            //       } else {
            //         return const Text('Falha');
            //       }
            //     } else {
            //       return const Text('carregando');
            //     }
            //   },
            // ),