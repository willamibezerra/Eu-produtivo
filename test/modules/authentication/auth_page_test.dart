import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_convert/app/modules/authentication/presentation/view/pages/auth_page.dart';
import 'package:mobx/mobx.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'mocks/controllers/mocked_auth_controller.mocks.mocks.dart';

class MockSvgAsset extends StatelessWidget {
  final String assetName;
  final double? height;

  const MockSvgAsset({Key? key, required this.assetName, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(height: height, width: height, color: Colors.grey);
  }
}

void main() {
  late MockAuthController mockAuthController;
  late MockRegisterUserController mockRegisterUserController;

  setUp(() {
    mockAuthController = MockAuthController();
    mockRegisterUserController = MockRegisterUserController();
  });

  // Helper function to build the widget under test
  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: AuthPage(
        controller: mockAuthController,
        registerUserController: mockRegisterUserController,
      ),
    );
  }

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  group('AuthPage Widget Tests', () {
    testWidgets('should display login title', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.text('LOGIN'), findsNWidgets(2));
    });

    testWidgets('should display email and password input fields', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.text('Seu Email'), findsWidgets);
      expect(find.text('Senha'), findsOneWidget);
    });

    testWidgets('should display login button', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.text('LOGIN'), findsAtLeastNWidgets(1));
    });

    testWidgets('should display register account option', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.text('Não tem uma conta?'), findsOneWidget);
      expect(find.text('Criar Conta'), findsOneWidget);
    });

    // testWidgets('should validate email field with empty input', (WidgetTester tester) async {
    //   await tester.pumpWidget(createWidgetUnderTest());

    //   await tester.tap(find.text('LOGIN'));
    //   await tester.pump();

    //   expect(find.text('Digite um endereço de email'), findsOneWidget);
    // });

    // testWidgets('should validate email field with invalid email', (WidgetTester tester) async {
    //   await tester.pumpWidget(createWidgetUnderTest());

    //   // Enter invalid email
    //   await tester.enterText(find.widgetWithText(TextField, 'Seu Email'), 'invalid-email');

    //   // Find and tap the login button to trigger validation
    //   await tester.tap(find.text('LOGIN'));
    //   await tester.pump();

    //   expect(find.text('Digite um email válido'), findsOneWidget);
    // });

    // testWidgets('should validate password field with empty input', (WidgetTester tester) async {
    //   await tester.pumpWidget(createWidgetUnderTest());

    //   // Enter valid email but empty password
    //   await tester.enterText(find.widgetWithText(TextField, 'Seu Email'), 'test@example.com');

    //   // Find and tap the login button to trigger validation
    //   await tester.tap(find.text('LOGIN'));
    //   await tester.pump();

    //   expect(find.text('Digite uma senha válida'), findsOneWidget);
    // });

    testWidgets('should toggle password visibility when suffix icon is tapped', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      expect(find.byIcon(Icons.visibility), findsOneWidget);
      await tester.tap(find.byIcon(Icons.visibility));
      await tester.pump();
      expect(find.byIcon(Icons.visibility_off), findsOneWidget);
      await tester.tap(find.byIcon(Icons.visibility_off));
      await tester.pump();
      expect(find.byIcon(Icons.visibility), findsOneWidget);
    });

    // testWidgets('should navigate to register page when "Criar Conta" is tapped', (WidgetTester tester) async {
    //   await tester.pumpWidget(createWidgetUnderTest());

    //   // Tap on the register button
    //   await tester.tap(find.text('Criar Conta').first);
    //   await tester.pump();

    //   // Verify navigation was called
    //   verify(Modular.to.pushNamed('/auth/register')).called(1);
    // });
  });
}
