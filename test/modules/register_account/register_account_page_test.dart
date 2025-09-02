import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_convert/app/modules/authentication/domain/repositories/auth_repository.dart';
import 'package:image_convert/app/modules/authentication/domain/repositories/interfaces/auth_repository_interface.dart';
import 'package:image_convert/app/modules/authentication/presentation/state/auth_controller.dart';
import 'package:image_convert/app/modules/authentication/presentation/view/components/register_account_page.dart';
import 'package:image_convert/app/modules/authentication/presentation/view/components/rounded_input_field.dart';
import 'package:image_convert/app/shared/app_module.dart';
import 'package:image_convert/app/shared/widgets/rounded_button.dart';

import '../authentication/mocks/repository/mocked_auth_repositories.mocks.dart';

void main() async {
  late AuthController authController;
  late MockAuthRepository authRepository;
  setUp(() {
    authRepository = MockAuthRepository();
    authController = AuthController(authRepository);
    Modular.init(ModuleMock());
  });

  testWidgets('Should display the create account page with all components', (WidgetTester tester) async {
    await tester.pumpWidget(
      ModularApp(
        module: ModuleMock(),
        child: MaterialApp(
          home: RegisterAccountPage(controller: authController),
        ),
      ),
    );

    await tester.pump();
    expect(find.text('CRIAR CONTA'), findsOneWidget);
    expect(find.byType(RoundedInputField), findsNWidgets(2));
    expect(find.byType(RoundedButton), findsOneWidget);
    expect(find.text('Fazer login'), findsOneWidget);
  });

  testWidgets('Should show password input as obscured by default and toggle on icon tap', (WidgetTester tester) async {
    await tester.pumpWidget(
      ModularApp(
        module: ModuleMock(),
        child: MaterialApp(
          home: RegisterAccountPage(controller: authController),
        ),
      ),
    );

    await tester.pump();

    final passwordField = find.byWidgetPredicate(
      (widget) => widget is RoundedInputField && widget.hintText == 'Sua Senha',
    );
    final obscureIcon = find.byIcon(Icons.visibility);

    expect(find.descendant(of: passwordField, matching: obscureIcon), findsOneWidget);

    await tester.tap(obscureIcon);
    await tester.pump();
    expect(find.byIcon(Icons.visibility_off), findsOneWidget);
  });

  testWidgets('Should handle create account action correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      ModularApp(
        module: ModuleMock(),
        child: MaterialApp(
          home: RegisterAccountPage(controller: authController),
        ),
      ),
    );

    await tester.pump();

    final emailField = find.widgetWithText(RoundedInputField, 'Seu Email');
    final passwordField = find.widgetWithText(RoundedInputField, 'Sua Senha');
    final createAccountButton = find.widgetWithText(RoundedButton, 'Criar conta');

    await tester.enterText(emailField, 'test@example.com');
    await tester.enterText(passwordField, 'password123');

    await tester.tap(createAccountButton);
    await tester.pump();
  });
}

class ModuleMock extends Module {
  @override
  void binds(Injector i) {
    i.add<AuthRepository>(MockAuthRepository.new);
  }
}
