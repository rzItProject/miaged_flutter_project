import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_project_miaged/firebase_options.dart';

import 'package:flutter_app_project_miaged/app_router.dart';
import 'package:flutter_app_project_miaged/utils/constants.dart';
import 'package:flutter_app_project_miaged/utils/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ProviderScope(
    child: MainApp(),
  ));
}

final navigatorKey = GlobalKey<NavigatorState>();

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        scaffoldMessengerKey: Utils.messengerKey,
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: treePage,
        // routes: {
        //   treePage: (context) => const WidgetTree(),
        //   signInPage: (context) => SignInPage(),
        //   registerPage: (context) => RegisterPage(),
        //   homePage: (context) => HomePage(),
        // },
        // home: const WidgetTree(),
      );
}
