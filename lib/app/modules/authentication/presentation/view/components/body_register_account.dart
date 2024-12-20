import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_convert/app/modules/authentication/presentation/state/auth_controller.dart';

import 'package:image_convert/app/modules/authentication/presentation/view/components/or_divider.dart';
import 'package:image_convert/app/modules/authentication/presentation/view/components/rounded_input_field.dart';
import 'package:image_convert/app/modules/authentication/presentation/view/components/socal_icon.dart';
import 'package:image_convert/app/shared/widgets/rounded_button.dart';
import 'package:image_convert/app/shared/widgets/style/app_colors.dart';

import 'background_registe_account.dart';

class BodyRegisterAccount extends StatefulWidget {
  final AuthController controller;
  final Size size;
  const BodyRegisterAccount({
    super.key,
    required this.size,
    required this.controller,
  });

  @override
  State<BodyRegisterAccount> createState() => _BodyRegisterAccountState();
}

class _BodyRegisterAccountState extends State<BodyRegisterAccount> {
  late TextEditingController _emailController;
  late TextEditingController _passWordController;

  final GlobalKey<FormState> _formKeyEmail = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyPassword = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  @override
  void initState() {
    _emailController = TextEditingController();
    _passWordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundRegisterAccount(
        size: widget.size,
        child: Observer(
          builder: (_) => SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'CRIAR CONTA',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: widget.size.height * 0.03,
                ),
                SvgPicture.asset(
                  'assets/icons/signup.svg',
                  height: widget.size.height * 0.35,
                ),
                RoundedInputField(
                    hintText: 'Seu Email',
                    onChanged: (p0) {},
                    size: widget.size,
                    controller: _emailController,
                    textFieldKey: _formKeyEmail,
                    validator: (p0) {
                      return null;
                    },
                    onTapVisibleText: () {},
                    obscureText: false),
                RoundedInputField(
                    suffixIcon: isPasswordVisible
                        ? Icons.visibility_off
                        : Icons.visibility,
                    icon: Icons.lock,
                    hintText: 'Sua Senha',
                    onChanged: (p0) {},
                    size: widget.size,
                    controller: _passWordController,
                    textFieldKey: _formKeyPassword,
                    validator: (p0) {
                      return null;
                    },
                    onTapVisibleText: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                    obscureText: isPasswordVisible),
                Observer(
                  builder: (_) {
                    return RoundedButton(
                        isLoading: widget.controller.isLoading ?? false,
                        press: () {
                          widget.controller.createAccount(
                              email: _emailController.text,
                              password: _passWordController.text);
                          if (widget.controller.createAccountSucess != null) {
                            if (widget.controller.createAccountSucess!) {
                              Modular.to.pushNamed('/auth/');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text(
                                      widget.controller.failureCreateUser ??
                                          ''),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text(
                                      widget.controller.failureCreateUser ??
                                          ''),
                                ),
                              );
                            }
                          }
                        },
                        size: widget.size,
                        text: 'Criar conta');
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Já tem uma conta?',
                      style: TextStyle(color: AppColors.kPrimaryColor),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Fazer login'),
                    ),
                  ],
                ),
                OrDivider(size: widget.size),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocalIcon(
                      isSvg: true,
                      imagePath: 'assets/icons/facebook.svg',
                      onTap: () {},
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SocalIcon(
                      isSvg: false,
                      imagePath: 'assets/icons/google_icon.png',
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
