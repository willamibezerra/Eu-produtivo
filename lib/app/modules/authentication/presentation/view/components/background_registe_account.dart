import 'package:flutter/material.dart';

class BackgroundRegisterAccount extends StatelessWidget {
  const BackgroundRegisterAccount({
    super.key,
    required this.size,
    required this.child,
  });

  final Size size;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Image.asset(
              'assets/images/signup_top.png',
              width: size.width * 0.35,
            ),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            width: size.width * 0.25,
            child: Image.asset('assets/images/main_bottom.png'),
          ),
          child
        ],
      ),
    );
  }
}
