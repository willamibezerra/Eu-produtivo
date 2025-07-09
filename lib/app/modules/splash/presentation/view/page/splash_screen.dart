import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_convert/app/modules/splash/domain/repository/user_authentication_verification_repository.dart';
import 'package:image_convert/app/modules/splash/presentation/view/state/controller/register_user_controller.dart';

class SplashScreen extends StatefulWidget {
  final RegisterUserController controller;
  
  const SplashScreen({super.key,  required this.controller});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await widget.controller.verifyUser(); 
    });
  


  
    timer();
    super.initState();
  }

  Future<void> timer() async {
Future.delayed(const Duration(seconds: 2), () {
    bool isLogged =  widget.controller.registered ?? false;
    if(isLogged){
        Modular.to.pushNamed('/home/');
    }else{
 Modular.to.pushNamed('/onBoarding/');    
    
  }
});

  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
