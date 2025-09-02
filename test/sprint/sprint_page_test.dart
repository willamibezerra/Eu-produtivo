import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_convert/app/modules/splash/presentation/view/state/controller/register_user_controller.dart';
import 'package:image_convert/app/modules/sprint/presentation/view/pages/sprint_page.dart';
import 'package:image_convert/app/modules/sprint/presentation/view/state/controllers/itens_sprint_controller.dart';
import 'package:image_convert/app/modules/sprint/presentation/view/widgets/body_sprint_widget.dart';
import 'package:mobx/mobx.dart' as mobx;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../modules/splash/splash_screen_test.dart';
import 'mocks/mocked_itens_sprint_controllers.mocks.mocks.dart';

// Mock Modular.to for navigation testing
class MockModularNavigator extends Mock implements IModularNavigator {}

// Helper function to create widget for testing
Future<void> createWidget(
  WidgetTester tester, {
  required MockItensSprintController itensSprintController,
  required MockRegisterUserController registerUserController,
  MockModularNavigator? navigator,
}) async {
  if (navigator != null) {
    Modular.navigatorDelegate = navigator;
  }

  await tester.pumpWidget(
    MaterialApp(
      home: SprintPage(
        controller: itensSprintController,
        registerUserController: registerUserController,
      ),
    ),
  );
  await tester.pumpAndSettle();
}

void main() {
  late MockRegisterUserController registerUserController;
  late MockItensSprintController itensSprintController;
  late MockModularNavigator navigator;

  setUp(() {
    registerUserController = MockRegisterUserController();
    itensSprintController = MockItensSprintController();
    navigator = MockModularNavigator();

    // Setup default mock responses using thenAnswer instead of thenReturn for Futures
    // when(itensSprintController.loadprogessFuture).thenReturn(
    //   mobx.ObservableFuture.value([]),
    // );
    // when(itensSprintController.loadTaskFuture).thenReturn(
    //   mobx.ObservableFuture.value([]),
    // );
    // when(itensSprintController.loadconcludesFuture).thenReturn(
    //   mobx.ObservableFuture.value([]),
    // );

    // // Setup reaction for registered state
    // when(registerUserController.registered).thenReturn(true);
  });

  // testWidgets('SprintPage should render correctly', (WidgetTester tester) async {
  //   await createWidget(
  //     tester,
  //     itensSprintController: itensSprintController,
  //     registerUserController: registerUserController,
  //   );

  //   expect(find.text('Sprint'), findsOneWidget);
  //   expect(find.byType(FloatingActionButton), findsOneWidget);
  //   expect(find.byType(Observer), findsOneWidget);
  //   verify(itensSprintController.loadTask()).called(1);
  // });

  // testWidgets('FloatingActionButton should show add task dialog', (WidgetTester tester) async {
  //   await createWidget(
  //     tester,
  //     itensSprintController: itensSprintController,
  //     registerUserController: registerUserController,
  //   );

  //   // Act
  //   await tester.tap(find.byType(FloatingActionButton));
  //   await tester.pumpAndSettle();

  //   // Assert
  //   expect(find.text('Adicionar tarefa'), findsOneWidget);
  //   expect(find.byType(TextField), findsOneWidget);
  //   expect(find.text('Cancelar'), findsOneWidget);
  //   expect(find.text('Salvar'), findsOneWidget);
  // });

  // testWidgets('Should add task when save button is pressed', (WidgetTester tester) async {
  //   await createWidget(
  //     tester,
  //     itensSprintController: itensSprintController,
  //     registerUserController: registerUserController,
  //   );

  //   // Act - Open dialog
  //   await tester.tap(find.byType(FloatingActionButton));
  //   await tester.pumpAndSettle();

  //   // Enter text
  //   await tester.enterText(find.byType(TextField), 'New Task');
  //   await tester.pumpAndSettle();

  //   // Save task
  //   await tester.tap(find.text('Salvar'));
  //   await tester.pumpAndSettle();

  //   // Assert
  //   verify(itensSprintController.toDoItem('New Task', null)).called(1);
  // });

  // testWidgets('Should show logout dialog when logout button is pressed', (WidgetTester tester) async {
  //   await createWidget(
  //     tester,
  //     itensSprintController: itensSprintController,
  //     registerUserController: registerUserController,
  //   );

  //   // Act
  //   await tester.tap(find.byIcon(Icons.logout));
  //   await tester.pumpAndSettle();

  //   // Assert
  //   expect(find.text('Sair do app?'), findsOneWidget);
  //   expect(find.text('Sim'), findsOneWidget);
  //   expect(find.text('Não'), findsOneWidget);
  // });

  // testWidgets('Should call deleteUser when confirming logout', (WidgetTester tester) async {
  //   await createWidget(
  //     tester,
  //     itensSprintController: itensSprintController,
  //     registerUserController: registerUserController,
  //     navigator: navigator,
  //   );

  //   // Act - Open logout dialog
  //   await tester.tap(find.byIcon(Icons.logout));
  //   await tester.pumpAndSettle();

  //   // Confirm logout
  //   await tester.tap(find.text('Sim'));
  //   await tester.pumpAndSettle();

  //   // Assert
  //   verify(registerUserController.deleteUser()).called(1);
  // });

  // testWidgets('Should dismiss logout dialog when clicking No', (WidgetTester tester) async {
  //   await createWidget(
  //     tester,
  //     itensSprintController: itensSprintController,
  //     registerUserController: registerUserController,
  //   );

  //   // Act - Open logout dialog
  //   await tester.tap(find.byIcon(Icons.logout));
  //   await tester.pumpAndSettle();

  //   // Click No
  //   await tester.tap(find.text('Não'));
  //   await tester.pumpAndSettle();

  //   // Assert
  //   expect(find.text('Sair do app?'), findsNothing);
  // });

  // testWidgets('Should show BodySprintWidget when futures are fulfilled', (WidgetTester tester) async {
  //   await createWidget(
  //     tester,
  //     itensSprintController: itensSprintController,
  //     registerUserController: registerUserController,
  //   );

  //   // Assert
  //   expect(find.byType(CircularProgressIndicator), findsNothing);
  //   expect(find.byType(BodySprintWidget), findsOneWidget);
  // });

  // testWidgets('Should show CircularProgressIndicator when futures are pending', (WidgetTester tester) async {
  //   // Setup pending futures using thenAnswer instead of thenReturn
  //   final pendingFuture = mobx.ObservableFuture<List<dynamic>>(Future.value([]));

  //   when(itensSprintController.loadprogessFuture).thenAnswer((_) => pendingFuture);
  //   when(itensSprintController.loadTaskFuture).thenAnswer((_) => pendingFuture);
  //   when(itensSprintController.loadconcludesFuture).thenAnswer((_) => pendingFuture);

  //   // Set the status to pending
  //   when(pendingFuture.status).thenReturn(mobx.FutureStatus.pending);

  //   await tester.pumpWidget(
  //     MaterialApp(
  //       home: SprintPage(
  //         controller: itensSprintController,
  //         registerUserController: registerUserController,
  //       ),
  //     ),
  //   );

  //   // Assert
  //   expect(find.byType(CircularProgressIndicator), findsOneWidget);
  //   expect(find.byType(BodySprintWidget), findsNothing);
  // });

  // testWidgets('Should navigate to onBoarding when registered becomes false', (WidgetTester tester) async {
  //   // Setup the reaction trigger
  //   when(registerUserController.registered).thenReturn(true);

  //   await createWidget(
  //     tester,
  //     itensSprintController: itensSprintController,
  //     registerUserController: registerUserController,
  //     navigator: navigator,
  //   );

  //   // Trigger the reaction by changing registered to false
  //   when(registerUserController.registered).thenReturn(false);

  //   // Manually trigger the reaction since we can't directly modify the observable
  //   final reaction = verify(registerUserController.registered).captured.last;

  //   // Need to rebuild the widget to trigger reaction
  //   await tester.pumpAndSettle();

  //   // Verify navigation was attempted
  //   verify(navigator.pushNamedAndRemoveUntil(
  //     '/onBoarding/',
  //     any,
  //     arguments: anyNamed('arguments'),
  //   )).called(1);
  // });

  test('cardWidget should render correctly with task', () {
    bool deletePressed = false;

    final widget = cardWidget(true, 'Test Task', () {
      deletePressed = true;
    });
    expect(widget is SizedBox, true);
    final SizedBox sizedBox = widget as SizedBox;
    final container = sizedBox.child as Container;
    final BoxDecoration decoration = container.decoration as BoxDecoration;
    expect(decoration.boxShadow!.length, 1);
    final Align align = container.child as Align;
    final Padding padding = align.child as Padding;
    final Column column = padding.child as Column;
    final Row row = column.children[0] as Row;
    final IconButton deleteButton = row.children[1] as IconButton;
    deleteButton.onPressed!();
    expect(deletePressed, true);
  });

  test('cardWidget should render correctly without task', () {
    final widget = cardWidget(false, null, () {});
    expect(widget is SizedBox, true);
    final SizedBox sizedBox = widget as SizedBox;
    final container = sizedBox.child as Container;
    final child = container.child as SizedBox;
    expect(child.height, 50);
  });
}
