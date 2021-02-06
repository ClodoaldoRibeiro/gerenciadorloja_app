import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gerenciadorloja_app/ui/themes/app_colors.dart';

class AlertDialogDelete extends StatelessWidget {
  Widget titulo;
  Widget conteudo;
  AlertDialogDelete({@required this.titulo, @required this.conteudo});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: titulo,
      content: conteudo,
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
