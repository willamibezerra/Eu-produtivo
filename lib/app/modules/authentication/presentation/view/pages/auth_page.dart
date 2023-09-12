import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:image_convert/app/modules/authentication/presentation/state/auth_controller.dart';
import 'package:image_convert/app/shared/widgets/input_widget.dart';

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
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(240, 240, 240, 0.903),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Center(
                child: SizedBox(
                  height: 200,
                  child: Icon(
                    Icons.picture_as_pdf,
                    size: 150,
                  ),
                ),
              ),
              Text(
                'Bem-vindo de volta, siga as etapas para acessar o app',
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
                    widget.controller.signInWithEmailAndPassword(
                        email: _emailController.text,
                        password: _passwordController.text);
                  },
                  child: const Text('Entrar'),
                ),
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Modular.to.pushNamed('/auth/register');
                    },
                    child: const Text('Criar conta'),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              const Text('Ou continue com:'),
              Observer(
                builder: (context) {
                  if (widget.controller.signInSucess != null) {
                    if (widget.controller.signInSucess!) {
                      return const Text('suceso');
                    } else {
                      return const Text('Falha');
                    }
                  } else {
                    return const Text('loading');
                  }
                },
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                  height: 150,
                  width: 150,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset('assets/images/google_icon.webp')))
            ],
          ),
        ),
      ),
    );
  }
}
