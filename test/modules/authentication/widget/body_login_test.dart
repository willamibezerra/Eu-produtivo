import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_convert/app/modules/authentication/data/data_sources/auth_data_source.dart';
import 'package:image_convert/app/modules/authentication/data/data_sources/interfaces/auth_data_source_interface.dart';
import 'package:image_convert/app/modules/authentication/data/firebase_authentication/auth.dart';
import 'package:image_convert/app/modules/authentication/domain/repositories/auth_repository.dart';
import 'package:image_convert/app/modules/authentication/presentation/state/auth_controller.dart';
import 'package:image_convert/app/modules/authentication/presentation/view/components/body_login.dart';
import 'package:image_convert/app/modules/splash/domain/repository/user_authentication_verification_repository.dart';
import 'package:image_convert/app/modules/splash/presentation/view/state/controller/register_user_controller.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Size testSize = const Size(360, 640);
  TestWidgetsFlutterBinding.ensureInitialized();
  late AuthController controller;
  late AuthRepository repository;
  late IauthDataSource dataSource;
  late Auth auth;
  late RegisterUserController registerUserController;
  late IuserAuthenticationVerificationRepository authenticationVerificationRepository;
  setUpAll(() {
    authenticationVerificationRepository = UserAuthenticationVerificationRepository();
    auth = Auth();
    dataSource = AuthDataSource(auth: auth);
    repository = AuthRepository(dataSource: dataSource);
    controller = AuthController(repository);
    registerUserController = RegisterUserController(repository: authenticationVerificationRepository);
  });
  testWidgets('should render correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BodyLogin(
            size: testSize,
            controller: controller,
            registerUserController: registerUserController,
          ),
        ),
      ),
    );

    expect(find.text('LOGIN'), findsOneWidget);
    expect(find.text('LOGIN'), findsOneWidget);
    await tester.tap(find.text('LOGIN'));
    await tester.pump();
  });
}
