import 'package:image_convert/app/modules/authentication/presentation/state/auth_controller.dart';
import 'package:image_convert/app/modules/splash/presentation/view/state/controller/register_user_controller.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks(<MockSpec<dynamic>>[
  MockSpec<AuthController>(),
  MockSpec<RegisterUserController>(),
])
class MockedAuthController {}
