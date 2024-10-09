import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_convert/app/shared/app_module.dart';
import 'package:image_convert/app/shared/widgets/style/app_colors.dart';
import 'package:image_convert/firebase_options.dart';

Future<void> main() async {  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});   

  @override
  Widget build(BuildContext context) {
    return ModularApp(
      module: AppModule(),
      child: MaterialApp.router(
        theme: ThemeData(
            primaryColor: AppColors.kPrimaryColor,
            scaffoldBackgroundColor: Colors.white),
        routerConfig: Modular.routerConfig,
      ),
    );
  }
}
