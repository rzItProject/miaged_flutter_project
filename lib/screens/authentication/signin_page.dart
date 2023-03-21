import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_project_miaged/data/providers/auth_customer_provider.dart';
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
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 60),
                // const FlutterLogo(size: 120.0),
                Icon(
                  Icons.lock,
                  size: 100,
                  color: Colors.blue.shade200,
                ),
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
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  textInputAction: TextInputAction.go,
                  obscureText: isTextFormFieldObscure,
                  validator: (value) => model.validatePassword(value),
                  onChanged: (value) => model.password = value,
                  decoration: InputDecoration(
                    labelText: 'Mot de passe',
                    hintText: 'Saisissez votre mot de passe',
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
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: isTextFormFieldObscure
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                      onPressed: () {
                        ref
                            .read(isTextFormFieldObscureProvider.notifier)
                            .state = !isTextFormFieldObscure;

                        // Ajouter votre action ici
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade200,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(color: Colors.black),
                        text: 'Pas de compte?  ',
                        children: [
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context)
                                      .pushReplacementNamed(registerPage);
                                },
                              text: 'S\'enregistrer',
                              style: TextStyle(
                                  color: Colors.blue.shade200,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
