import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';

import 'package:image_convert/app/modules/authentication/presentation/state/auth_controller.dart';
import 'package:image_convert/app/modules/authentication/presentation/view/components/background_login.dart';
import 'package:image_convert/app/modules/authentication/presentation/view/components/rounded_input_field.dart';
import 'package:image_convert/app/modules/splash/presentation/view/state/controller/register_user_controller.dart';
import 'package:image_convert/app/shared/widgets/rounded_button.dart';
import 'package:image_convert/app/shared/widgets/style/app_colors.dart';
import 'package:mobx/mobx.dart';

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
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  final GlobalKey<FormState> _formKeyEmail = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyPassword = GlobalKey<FormState>();
  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    super.initState();
  }

  bool isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: BackgroundLogin(
          size: size,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'LOGIN',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                SvgPicture.asset(
                  'assets/icons/login.svg',
                  height: size.height * 0.35,
                ),
                RoundedInputField(
                  obscureText: false,
                  onTapVisibleText: () {},
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Digite um endereço de email';
                    } else if (!isEmailValid(value)) {
                      return 'Digite um email válido';
                    }

                    return null;
                  },
                  textFieldKey: _formKeyEmail,
                  controller: _emailController,
                  size: size,
                  hintText: 'Seu Email',
                  onChanged: (p0) {},
                ),
                RoundedInputField(
                  obscureText: isPasswordVisible,
                  onTapVisibleText: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                  textFieldKey: _formKeyPassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Digite uma senha válida';
                    }
                    return null;
                  },
                  controller: _passwordController,
                  icon: Icons.lock,
                  size: size,
                  hintText: 'Senha',
                  onChanged: (p0) {},
                  suffixIcon: isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                ),
                Observer(
                  builder: (context) {
                    final future = widget.controller.loadSignFuture;

                    return RoundedButton(
                        isLoading: future?.status == FutureStatus.pending,
                        press: () {
                          if (_formKeyEmail.currentState?.validate() ?? false) {
                            widget.registerUserController.save();
                            widget.controller.signFuture(email: _emailController.text, password: _passwordController.text);
                            widget.controller.listenStateSignIn(onSuccess: () {
                              Modular.to.pushNamedAndRemoveUntil(
                                '/home/',
                                (p0) => false,
                              );
                            }, onFailure: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text('falha ao entrar'),
                                ),
                              );
                            });
                          }
                        },
                        size: size,
                        text: 'LOGIN');
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Não tem uma conta?',
                      style: TextStyle(color: AppColors.kPrimaryColor),
                    ),
                    TextButton(
                      onPressed: () {
                        Modular.to.pushNamed('/auth/register');
                      },
                      child: const Text(
                        'Criar Conta',
                        style: TextStyle(color: AppColors.kPrimaryColor, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }

  bool isEmailValid(String email) {
    final RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegExp.hasMatch(email);
  }
}
