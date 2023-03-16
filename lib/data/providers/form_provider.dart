import 'package:flutter_app_project_miaged/services/auth_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authControllerProvider = ChangeNotifierProvider(
  (ref) => AuthController(),
);

final isTextFormFieldObscureProvider = StateProvider<bool>((ref) => true);
