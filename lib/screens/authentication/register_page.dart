import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_project_miaged/data/providers/auth_provider.dart';
import 'package:flutter_app_project_miaged/data/providers/form_provider.dart';
import 'package:flutter_app_project_miaged/utils/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterPage extends ConsumerWidget {
  RegisterPage({super.key});

  final _formKey = GlobalKey<FormState>();

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
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 60),
              const FlutterLogo(size: 120.0),
              const SizedBox(height: 20),
              const Text(
                'Bienvenu,\n Créez-vous un compte !',
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
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Saisissez votre email de connexion',
                  prefixIcon: Icon(
                    Icons.email,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              TextFormField(
                textInputAction: TextInputAction.next,
                obscureText: isTextFormFieldObscure,
                validator: (value) => model.validateRegisterPassword(value),
                onChanged: (value) => model.password = value,
                decoration: InputDecoration(
                  labelText: 'Mot de passe',
                  hintText: 'Saisissez votre mot de passe',
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: isTextFormFieldObscure
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                    onPressed: () {
                      ref.read(isTextFormFieldObscureProvider.notifier).state =
                          !isTextFormFieldObscure;
                    },
                  ),
                ),
              ),
              const SizedBox(height: 4),
              TextFormField(
                textInputAction: TextInputAction.go,
                obscureText: isTextFormFieldObscure,
                validator: (value) => model.validateConfirmPassword(
                    model.password.trim(), model.confirmPassword.trim()),
                onChanged: (value) => model.confirmPassword = value,
                decoration: InputDecoration(
                  labelText: 'Confirmer mot de passe',
                  hintText: 'Saisissez votre mot de passe',
                  prefixIcon: const Icon(Icons.privacy_tip),
                  suffixIcon: IconButton(
                    icon: isTextFormFieldObscure
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                    onPressed: () {
                      ref.read(isTextFormFieldObscureProvider.notifier).state =
                          !isTextFormFieldObscure;
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                icon: const Icon(Icons.arrow_forward),
                label: const Text(
                  'S\'inscrire',
                  style: TextStyle(fontSize: 24),
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    auth.register(
                      context: context,
                      email: model.email.trim(),
                      password: model.password.trim(),
                    );
                  }
                },
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(color: Colors.black),
                      text: 'Vous avez déjà un compte? ',
                      children: [
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context)
                                    .pushReplacementNamed(signInPage);
                              },
                            text: 'Connectez-vous',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Theme.of(context).colorScheme.secondary,
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
