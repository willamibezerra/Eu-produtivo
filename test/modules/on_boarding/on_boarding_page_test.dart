import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_convert/app/modules/on_boarding/presentation/view/pages/on_boarding_page.dart';

void main() {
  testWidgets('OnBoardingWidget renders and navigates correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: OnBoardingPage(),
      ),
    );
    expect(find.text('Bem-Vindo'), findsOneWidget);
    expect(find.text('Prepare-se'), findsNothing);
    await tester.drag(find.byType(OnBoardingSlider), const Offset(-400.0, 0.0));
    await tester.pumpAndSettle();
    expect(find.text('Bem-Vindo'), findsNothing);
    expect(find.text('Prepare-se'), findsOneWidget);
    expect(find.text('Confirmar'), findsOneWidget);
  });
}
