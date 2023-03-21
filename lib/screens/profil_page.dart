import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_project_miaged/data/models/customer.model.dart';
import 'package:flutter_app_project_miaged/data/providers/auth_customer_provider.dart';
import 'package:flutter_app_project_miaged/data/providers/home_pages_provider.dart';
import 'package:flutter_app_project_miaged/utils/utils.dart';
// import 'package:flutter_app_project_miaged/widgets/top_container.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilPage extends ConsumerWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserProvider);

    final formKey = GlobalKey<FormState>();
    String name = '';
    String password = '';
    String email = '';
    String address = '';
    String city = '';
    String zipCode = '';
    String birthday = '';

    const coverHeight = 200.0;
    const profilHeight = 180.0;
    const top = coverHeight - profilHeight / 2;
    const bottom = profilHeight / 1.5;
    const url =
        'https://images.pexels.com/photos/255379/pexels-photo-255379.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1';

    return currentUser.when(
      data: (user) {
        if (user != null) {
          final customerById = ref.watch(customerStreamProvider(user.uid));
          return customerById.when(
            data: (customer) {
              if (customer != null) {
                return Scaffold(
                  appBar: AppBar(
                    title: Text('Profil',
                        style: kTitleStyle.copyWith(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w500)),
                    backgroundColor: Colors.black54,
                  ),
                  backgroundColor: Colors.white,
                  body: ListView(children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: bottom),
                      child: buildTop(url, coverHeight, top),
                    ),
                    buildContent(formKey, customer, name, email, password,
                        birthday, address, city, zipCode, ref, context),
                  ]),
                );
              }
              return const Text('Hello');
            },
            loading: () {
              return const Center(child: CircularProgressIndicator());
            },
            error: (error, stackTrace) {
              return const Center(child: Text('Error'));
            },
          );
        }
        return const Center(child: Text('No User'));
      },
      loading: () {
        return const Center(child: CircularProgressIndicator());
      },
      error: (error, stackTrace) {
        return const Center(child: Text('Error'));
      },
    );
  }

  Widget buildContent(
      GlobalKey<FormState> formKey,
      Customer customer,
      String name,
      String email,
      String password,
      String birthday,
      String address,
      String city,
      String zipCode,
      WidgetRef ref,
      BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FieldTitle(title: 'Votre nom et prenom'),
            TextFormField(
              initialValue: customer.fullname,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.all(15.0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100.0),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.red),
                ),
                fillColor: Colors.grey.shade50,
                filled: true,
              ),
              // onChanged: (value) => name = value,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Entrez un nom';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            const FieldTitle(title: 'Votre email'),
            TextFormField(
              initialValue: customer.email,
              readOnly: true,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.all(15.0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.red),
                ),
                fillColor: Colors.grey.shade50,
                filled: true,
              ),
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) => email = value,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Entrez un email';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            const FieldTitle(title: 'Votre mot de passe'),
            TextFormField(
              initialValue: customer.password,
              obscureText: true,
              readOnly: true,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.all(15.0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.red),
                ),
                fillColor: Colors.grey.shade50,
                filled: true,
              ),
              onChanged: (value) => password = value,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Entrez un Mot de passe';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            const FieldTitle(title: 'Votre date de naissance'),
            TextFormField(
              initialValue: customer.birthDate,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.all(15.0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.red),
                ),
                fillColor: Colors.grey.shade50,
                filled: true,
              ),
              keyboardType: TextInputType.datetime,
              onChanged: (value) => birthday = value,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Entrez une date d\'anniversaire valide';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            const FieldTitle(title: 'Votre adresse'),
            TextFormField(
              initialValue: customer.address,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.all(15.0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.red),
                ),
                fillColor: Colors.grey.shade50,
                filled: true,
              ),
              keyboardType: TextInputType.streetAddress,
              onChanged: (value) => address = value,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Entrez une adresse valide';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            const FieldTitle(title: 'Votre ville'),
            TextFormField(
              initialValue: customer.city,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.all(15.0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.red),
                ),
                fillColor: Colors.grey.shade50,
                filled: true,
              ),
              keyboardType: TextInputType.streetAddress,
              onChanged: (value) => city = value,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Entrez une ville valide';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            const FieldTitle(title: 'Votre code postal'),
            TextFormField(
              initialValue: customer.zipcode,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.all(15.0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.red),
                ),
                fillColor: Colors.grey.shade50,
                filled: true,
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              onChanged: (value) => zipCode = value,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Entrez un code postal';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  elevation: 4,
                  backgroundColor: Colors.blue.shade50,
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    final updatedCustomer = Customer(
                      id: customer.id,
                      fullname: name == '' ? customer.fullname : name,
                      email: email == '' ? customer.email : email,
                      password: password == '' ? customer.password : password,
                      address: address == '' ? customer.address : address,
                      city: city == '' ? customer.city : city,
                      zipcode: zipCode == '' ? customer.zipcode : zipCode,
                      birthDate: birthday == '' ? customer.birthDate : birthday,
                    );
                    ref
                        .read(customerRepositoryProvider)
                        .updateCustomer(updatedCustomer);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Profile updated')),
                    );
                  }
                },
                child: Text(
                  'Sauvegarder'.toUpperCase(),
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {
                  ref.read(authRepositoryProvider).signOut();
                  ref.watch(indexProvider.notifier).state = 0;
                },
                icon: const Icon(Icons.arrow_circle_left),
                label: Text(
                  'Se déconnecter'.toUpperCase(),
                  style: const TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  elevation: 4,
                  backgroundColor: Colors.grey.shade500,
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          ],
        ),
      ),
    );
  }

  Widget buildTop(String url, double coverHeight, double top) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        ClipRRect(
          child: CachedNetworkImage(
            imageUrl: url,
            height: coverHeight,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: top,
          child: ClipRRect(
            child: CachedNetworkImage(
              imageUrl:
                  'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8',
              imageBuilder: (context, imageProvider) => Container(
                height: 180,
                width: 180,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 5,
                      color: Colors.white,
                    ),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(100.0)),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    )),
              ),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
        ),
      ],
    );
  }
}

class FieldTitle extends StatelessWidget {
  const FieldTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
