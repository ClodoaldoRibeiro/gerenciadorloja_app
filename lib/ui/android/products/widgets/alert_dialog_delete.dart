import 'package:flutter/material.dart';
import 'package:gerenciadorloja_app/ui/themes/app_colors.dart';

class AlertDialogDelete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text("Esse produto será removido da sua lista de itens e " +
          "não ficará mais disponível para vendas."),
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
