import 'package:flutter/foundation.dart';

class AuthController extends ChangeNotifier {
  String _email = '';
  String _password = '';
  String _confirmPassword = '';
  bool _loading = false;
  final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
  );
  final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()\-_=+{};:,<.>])(?!.*\s).{8,}$',
  );

  String get email => _email;

  set email(String email) {
    _email = email;
    notifyListeners();
  }

  String get password => _password;

  set password(String password) {
    _password = password;
    notifyListeners();
  }

  String get confirmPassword => _confirmPassword;

  set confirmPassword(String password) {
    _confirmPassword = password;
    notifyListeners();
  }

  bool get loading => _loading;

  set loading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez entrer une adresse e-mail';
    }
    if (!_emailRegExp.hasMatch(value)) {
      return 'Veuillez entrer une adresse e-mail valide';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez entrer un mot de passe';
    }
    return null;
  }

  String? validateRegisterPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez entrer un mot de passe';
    }
    if (!_passwordRegExp.hasMatch(value)) {
      return 'Le mot de passe doit contenir au moins, une lettre majuscule,\nune lettre minuscule, un chiffre, un caractère spécial,\net avoir une longueur minimale de 8 caractères';
    }
    return null;
  }

  String? validateConfirmPassword(String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Veuillez confirmer votre mot de passe';
    }
    if (password != confirmPassword) {
      return 'Les mots de passe ne correspondent pas';
    }
    return null;
  }
}
