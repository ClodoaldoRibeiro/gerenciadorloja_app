import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gerenciadorloja_app/ui/themes/app_colors.dart';

class AlertDialogDelete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Excluir este registro?"),
        content: Text("Essa ação não pode ser recuperada!"),
      actions: [
        FlatButton(
          child:
              Text("Cancelar", style: TextStyle(color: AppColors.COR_PRIMARIA)),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
        FlatButton(
          child: Text(
            "Excluir",
            style: TextStyle(color: AppColors.COR_PRIMARIA),
          ),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
      ],
    );
  }
}
