import 'package:flutter_app_project_miaged/services/auth_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authControllerProvider = ChangeNotifierProvider(
  (ref) => AuthController(),
);

final isTextFormFieldObscureProvider = StateProvider<bool>((ref) => true);

/* //Pas besoin de vous préoccuper de la suppression des TextEditingController
//dans la méthode dispose d'un widget ou dans toute autre méthode de nettoyage.
final emailControllerProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());

final passwordControllerProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());

final confirmPasswordControllerProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController()); */
