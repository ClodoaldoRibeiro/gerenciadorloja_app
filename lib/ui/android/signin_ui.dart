import 'package:flutter/material.dart';
import 'package:gerenciadorloja_app/blocs/signin_bloc.dart';
import 'package:gerenciadorloja_app/ui/android/widgets/input_field.dart';
import 'package:gerenciadorloja_app/ui/themes/constants.dart';

class SigninUI extends StatefulWidget {
  @override
  _SigninUIState createState() => _SigninUIState();
}

class _SigninUIState extends State<SigninUI> {
  final _signinBLoC = SigninBLoC();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(
                    Icons.account_circle,
                    color: kPrimaryColor,
                    size: 160,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InputField(
                    hint: "Digite seu e-mail",
                    icon: Icons.person_outline,
                    obscure: false,
                    stream: _signinBLoC.outEmail,
                    onChanged: _signinBLoC.changeEmail,
                  ),
                  InputField(
                    hint: "Informe sua senha",
                    icon: Icons.vpn_key_outlined,
                    obscure: true,
                    stream: _signinBLoC.outPassword,
                    onChanged: _signinBLoC.changePassword,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  StreamBuilder<bool>(
                      stream: _signinBLoC.outSubmitValid,
                      builder: (context, snapshot) {
                        return SizedBox(
                          height: 50,
                          child: RaisedButton(
                            onPressed: snapshot.hasData ? () {} : null,
                            color: kPrimaryColor,
                            textColor: Colors.white,
                            disabledColor: kPrimaryLightColor,
                            child: Text(
                              "Sign in",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        );
                      })
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
