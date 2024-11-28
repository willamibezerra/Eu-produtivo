import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_convert/app/modules/authentication/presentation/state/auth_controller.dart';

import '../../../../../shared/widgets/input_widget.dart';

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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'informe seu email e crie uma senha',
              style: GoogleFonts.baloo2(fontSize: 14),
            ),
            const SizedBox(
              height: 30,
            ),
            InputWidget(
              controller: _emailController,
              label: 'Email',
            ),
            const SizedBox(
              height: 15,
            ),
            InputWidget(
              controller: _passwordController,
              label: 'Senha',
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: double.maxFinite,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  widget.controller.createAccount(
                      email: _emailController.text,
                      password: _passwordController.text);
                },
                child: const Text('Entrar'),
              ),
            ),
            Observer(
              builder: (context) {
                if (widget.controller.createAccountSucess != null) {
                  if (widget.controller.createAccountSucess!) {
                    return const Text('suceso');
                  } else {
                    return const Text('Falha');
                  }
                } else {
                  return const Text('carregando');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
