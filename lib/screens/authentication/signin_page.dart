import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_project_miaged/data/providers/auth_provider.dart';
import 'package:flutter_app_project_miaged/data/providers/form_provider.dart';
import 'package:flutter_app_project_miaged/utils/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInPage extends ConsumerWidget {
  SignInPage({super.key});

  final _formKey = GlobalKey<FormState>();

  // final AuthService _authService = AuthService();

  Widget _title() {
    return const Text('Miaged');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isTextFormFieldObscure = ref.watch(isTextFormFieldObscureProvider);
    final model = ref.watch(authControllerProvider);
    final auth = ref.watch(authRepositoryProvider);
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 60),
              const FlutterLogo(size: 120.0),
              const SizedBox(height: 20),
              const Text(
                'Bon retour parmi nous, \n Connectez-vous à votre compte !',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 30.0),
              TextFormField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                enableSuggestions: true,
                validator: (value) => model.validateEmail(value),
                onChanged: (value) => model.email = value,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Saisissez votre email de connexion',
                  prefixIcon: const Icon(
                    Icons.email,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                textInputAction: TextInputAction.go,
                obscureText: isTextFormFieldObscure,
                validator: (value) => model.validatePassword(value),
                onChanged: (value) => model.password = value,
                decoration: InputDecoration(
                  labelText: 'Mot de passe',
                  hintText: 'Saisissez votre mot de passe',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: isTextFormFieldObscure
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                    onPressed: () {
                      ref.read(isTextFormFieldObscureProvider.notifier).state =
                          !isTextFormFieldObscure;

                      // Ajouter votre action ici
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  icon: const Icon(Icons.lock_open),
                  label: const Text(
                    'Se connecter',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () async {
                    // close virtual keyboard
                    FocusScope.of(context).unfocus();
                    if (_formKey.currentState!.validate()) {
                      auth.signIn(
                        context: context,
                        email: model.email.trim(),
                        password: model.password.trim(),
                      );
                      // Navigator.of(context).pushReplacementNamed(treePage);
                    }
                  }),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(color: Colors.black),
                      text: 'Pas de compte? ',
                      children: [
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context)
                                    .pushReplacementNamed(registerPage);
                              },
                            text: 'S\'enregistrer',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Theme.of(context).colorScheme.secondary,
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
