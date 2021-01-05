import 'package:flutter/material.dart';
import 'package:gerenciadorloja_app/ui/android/signin_ui.dart';
import 'package:gerenciadorloja_app/ui/themes/theme.dart';

class AndroidApp extends StatelessWidget {
  //Inicia a aplicação
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Gerenciador Loja Virtual',
        theme: theme(),
        home: SigninUI());
  }
}
