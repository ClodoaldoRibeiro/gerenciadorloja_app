import 'package:flutter/material.dart';
import 'package:gerenciadorloja_app/screens/signin_screen.dart';
import 'package:gerenciadorloja_app/settings/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Gerenciador Loja Virtual',
        theme: theme(),
        home: SigninScreen());
  }
}
