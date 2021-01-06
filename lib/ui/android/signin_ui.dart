import 'package:flutter/material.dart';
import 'package:gerenciadorloja_app/blocs/signin_bloc.dart';
import 'package:gerenciadorloja_app/ui/android/widgets/input_field.dart';
import 'package:gerenciadorloja_app/ui/themes/constants.dart';

import 'home_ui.dart';

class SigninUI extends StatefulWidget {
  @override
  _SigninUIState createState() => _SigninUIState();
}

class _SigninUIState extends State<SigninUI> {
  final _signinBLoC = SigninBLoC();

  @override
  void initState() {
    super.initState();

    _signinBLoC.outState.listen((state) {
      switch (state) {
        case LoginState.SUCCESS:
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomeUI()));
          break;
        case LoginState.FAIL:
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text("Erro"),
                    content: Text("Você não possui os privilégios necessários"),
                  ));
          break;
        case LoginState.LOADING:
        case LoginState.IDLE:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<LoginState>(
          stream: _signinBLoC.outState,
          initialData: LoginState.SUCCESS,
          builder: (context, snapshot) {
            print(snapshot.data);

            switch (snapshot.data) {
              case LoginState.LOADING:
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.pinkAccent),
                  ),
                );
              case LoginState.FAIL:
              case LoginState.SUCCESS:
              case LoginState.IDLE:
                return Stack(
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
                                      onPressed: snapshot.hasData
                                          ? _signinBLoC.submit
                                          : null,
                                      color: kPrimaryColor,
                                      textColor: Colors.white,
                                      disabledColor: kPrimaryLightColor,
                                      child: Text(
                                        "Entrar",
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
                );
            }
          }),
    );
  }
}
