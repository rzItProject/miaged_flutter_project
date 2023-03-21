import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_project_miaged/data/providers/auth_customer_provider.dart';
import 'package:flutter_app_project_miaged/data/providers/form_provider.dart';
import 'package:flutter_app_project_miaged/services/auth_controller.dart';
import 'package:flutter_app_project_miaged/utils/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterPage extends ConsumerWidget {
  RegisterPage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isTextFormFieldObscure = ref.watch(isTextFormFieldObscureProvider);
    final model = ref.watch(authControllerProvider);
    final auth = ref.watch(authRepositoryProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Miaged'),
        backgroundColor: Colors.black54,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 60),
              // const FlutterLogo(size: 120.0),
              Icon(
                Icons.person_2_rounded,
                size: 100,
                color: Colors.blue.shade200,
              ),
              const SizedBox(height: 20),
              const RegisterPageTitle(
                  title: 'Bienvenu,\n Créez-vous un compte !'),
              const SizedBox(height: 30.0),
              EmailTextFormField(model: model),
              const SizedBox(height: 20),
              PasswordTextFormField(
                isTextFormFieldObscure: isTextFormFieldObscure,
                model: model,
                ref: ref,
              ),
              const SizedBox(height: 20),
              ConfirmPasswordTextFormField(
                isTextFormFieldObscure: isTextFormFieldObscure,
                model: model,
                ref: ref,
              ),
              const SizedBox(height: 20.0),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade200,
                  shape: const StadiumBorder(),
                  minimumSize: const Size.fromHeight(50),
                ),
                icon: const Icon(Icons.arrow_forward),
                label: const Text(
                  'S\'inscrire',
                  style: TextStyle(fontSize: 20),
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
              const Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text('Ou'),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              const AlreadyHaveAccount(),
            ],
          ),
        ),
      ),
    );
  }
}

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
            style: const TextStyle(color: Color.fromRGBO(0, 0, 0, 1)),
            text: 'Vous avez déjà un compte?  ',
            children: [
              TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.of(context).pushReplacementNamed(signInPage);
                    },
                  text: 'Connectez-vous',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary,
                  ))
            ],
          ),
        )
      ],
    );
  }
}

class ConfirmPasswordTextFormField extends StatelessWidget {
  const ConfirmPasswordTextFormField(
      {super.key,
      required this.isTextFormFieldObscure,
      required this.model,
      required this.ref});

  final bool isTextFormFieldObscure;
  final AuthController model;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.go,
      obscureText: isTextFormFieldObscure,
      validator: (value) => model.validateConfirmPassword(
          model.password.trim(), model.confirmPassword.trim()),
      onChanged: (value) => model.confirmPassword = value,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.all(15.0),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
          borderSide: const BorderSide(color: Colors.black),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
          borderSide: const BorderSide(color: Colors.red),
        ),
        fillColor: Colors.grey.shade50,
        filled: true,
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
    );
  }
}

class PasswordTextFormField extends StatelessWidget {
  const PasswordTextFormField(
      {super.key,
      required this.isTextFormFieldObscure,
      required this.model,
      required this.ref});

  final bool isTextFormFieldObscure;
  final AuthController model;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      obscureText: isTextFormFieldObscure,
      validator: (value) => model.validateRegisterPassword(value),
      onChanged: (value) => model.password = value,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.all(15.0),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
          borderSide: const BorderSide(color: Colors.black),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
          borderSide: const BorderSide(color: Colors.red),
        ),
        fillColor: Colors.grey.shade50,
        filled: true,
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
    );
  }
}

class EmailTextFormField extends StatelessWidget {
  const EmailTextFormField({
    super.key,
    required this.model,
  });

  final AuthController model;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      enableSuggestions: true,
      validator: (value) => model.validateEmail(value),
      onChanged: (value) => model.email = value,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.all(15.0),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
          borderSide: const BorderSide(color: Colors.black),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
          borderSide: const BorderSide(color: Colors.red),
        ),
        fillColor: Colors.grey.shade50,
        filled: true,
        labelText: 'Email',
        hintText: 'Saisissez votre email de connexion',
        prefixIcon: const Icon(
          Icons.email,
        ),
      ),
    );
  }
}

class RegisterPageTitle extends StatelessWidget {
  final String title;

  const RegisterPageTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
    );
  }
}
