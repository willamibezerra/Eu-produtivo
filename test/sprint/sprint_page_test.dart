// test/lib/app/modules/sprint/presentation/view/pages/sprint_page_test.dart
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_convert/app/modules/authentication/data/data_sources/auth_data_source.dart';
import 'package:image_convert/app/modules/authentication/data/data_sources/interfaces/auth_data_source_interface.dart';
import 'package:image_convert/app/modules/authentication/data/firebase_authentication/auth.dart';
import 'package:image_convert/app/modules/authentication/domain/repositories/auth_repository.dart';
import 'package:image_convert/app/modules/authentication/presentation/state/auth_controller.dart';
import 'package:image_convert/app/modules/splash/domain/repository/user_authentication_verification_repository.dart';
import 'package:image_convert/app/modules/sprint/domain/repositories/interfaces/load_todo_itens_repository_interface.dart';
import 'package:image_convert/app/modules/sprint/domain/repositories/load_todo_itens_reposirory.dart';
import 'package:image_convert/app/modules/sprint/presentation/view/pages/sprint_page.dart';
import 'package:image_convert/app/modules/sprint/presentation/view/state/controllers/itens_sprint_controller.dart';
import 'package:image_convert/app/modules/splash/presentation/view/state/controller/register_user_controller.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  TestWidgetsFlutterBinding.ensureInitialized();
  late IloadTodoItensRepository loadTodoItensRepository;
  late Auth auth;
  late IuserAuthenticationVerificationRepository authenticationVerificationRepository;
  setUpAll(() {
    loadTodoItensRepository = LoadTodoItensReposirory();
    authenticationVerificationRepository = UserAuthenticationVerificationRepository();
    auth = Auth();
  });
  testWidgets('SprintPage renders correctly', (WidgetTester tester) async {
    final registerUserController = RegisterUserController(repository: authenticationVerificationRepository);
    final itensSprintController = ItensSprintController(firebaseAuth: auth, todoItensRepository: loadTodoItensRepository);
    await tester.pumpWidget(
      MaterialApp(
        home: SprintPage(
          registerUserController: registerUserController,
          controller: itensSprintController,
        ),
      ),
    );

    expect(find.text('Sprint'), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });
}
