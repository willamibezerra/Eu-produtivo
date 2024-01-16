import 'package:flutter/material.dart';

class BackgroundLogin extends StatelessWidget {
  final Widget child;
  double? leftPadding;
  double? rightPadding;

  BackgroundLogin({
    Key? key,
    required this.child,
    this.leftPadding,
    this.rightPadding,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              'assets/images/main_top.png',
              width: size.width * 0.3,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              'assets/images/login_bottom.png',
              width: size.width * 0.4,
            ),
          ),
          Positioned(
              left: leftPadding ?? size.width * 0.1,
              top: size.width * 0.2,
              right: rightPadding,
              child: child)
        ],
      ),
    );
  }
}
