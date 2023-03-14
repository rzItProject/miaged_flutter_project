import 'package:flutter/material.dart';

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
