import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_convert/app/modules/splash/presentation/view/page/splash_screen.dart';
import 'package:image_convert/app/modules/splash/presentation/view/state/controller/register_user_controller.dart';
import 'package:mockito/mockito.dart';

class MockRegisterUserController extends Mock implements RegisterUserController {}

void main() {
  late MockRegisterUserController mockController;

  setUp(() {
    mockController = MockRegisterUserController();
  });

  testWidgets('SplashScreen shows CircularProgressIndicator', (WidgetTester tester) async {
    when(mockController.verifyUser()).thenAnswer((_) async => true);

    await tester.pumpWidget(MaterialApp(
      home: SplashScreen(controller: mockController),
    ));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('Navigates to /home/ if user is logged in', (WidgetTester tester) async {
    when(mockController.verifyUser()).thenAnswer((_) async => true);
    when(mockController.registered).thenReturn(true);

    await tester.pumpWidget(MaterialApp(
      home: SplashScreen(controller: mockController),
    ));

    await tester.pumpAndSettle(const Duration(seconds: 2));
  });

  testWidgets('Navigates to /onBoarding/ if user is not logged in', (WidgetTester tester) async {
    when(mockController.verifyUser()).thenAnswer((_) async => true);
    when(mockController.registered).thenReturn(false);

    await tester.pumpWidget(MaterialApp(
      home: SplashScreen(controller: mockController),
    ));

    await tester.pumpAndSettle(const Duration(seconds: 2));
  });
}
