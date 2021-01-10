import 'package:flutter/material.dart';
import 'package:gerenciadorloja_app/ui/themes/constants.dart';
import 'package:gerenciadorloja_app/ui/themes/app_colors.dart';

class InputField extends StatelessWidget {
  final IconData icon;
  final String hint;
  final bool obscure;
  final Stream<String> stream;
  final Function(String) onChanged;

  InputField(
      {@required this.icon,
      @required this.hint,
      @required this.obscure,
      @required this.stream,
      @required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
        stream: stream,
        builder: (context, snapshot) {
          return TextField(
            onChanged: onChanged,
            decoration: InputDecoration(
                icon: Icon(
                  icon,
                  color: AppColors.COR_PALLETA[500],
                ),
                hintText: hint,
                hintStyle: TextStyle(color: AppColors.COR_PALLETA[500]),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.COR_PALLETA[500])),
                contentPadding:
                    EdgeInsets.only(left: 5, right: 30, bottom: 30, top: 30),
                errorText: snapshot.hasError ? snapshot.error : null),
            style: TextStyle(color: AppColors.COR_PALLETA[500]),
            obscureText: obscure,
          );
        });
  }
}
