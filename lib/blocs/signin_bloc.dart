import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:gerenciadorloja_app/validators/signin_validator.dart';
import 'package:rxdart/rxdart.dart';

class SigninBLoC extends BlocBase with SigninValidators {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Stream<String> get outEmail =>
      _emailController.stream.transform(validateEmail);

  Stream<String> get outPassword =>
      _passwordController.stream.transform(validatePassword);

  @override
  void dispose() {
    _emailController.close();
    _passwordController.close();
    // TODO: implement dispose
  }
}
