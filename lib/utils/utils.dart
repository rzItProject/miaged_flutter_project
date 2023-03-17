import 'package:flutter/material.dart';

const kTitleStyle = TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.bold,
  letterSpacing: 1.5,
  color: Colors.black,
);
const kNornalStyle = TextStyle(
  fontSize: 15,
  color: Colors.black,
);

class Utils {
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();
  static showSnackBar(BuildContext context, String? text) {
    if (text == null) return;

    FocusScope.of(context).unfocus();
    final snackBar = SnackBar(
      content: Text(
        text,
        style: const TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.red[100],
    );

    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}

class Navigation {
  static GlobalKey<NavigatorState> appNavigation = GlobalKey();
  static GlobalKey<NavigatorState> nestedNavigation = GlobalKey();
}
