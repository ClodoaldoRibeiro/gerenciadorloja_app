import 'package:flutter/material.dart';
import 'package:gerenciadorloja_app/ui/themes/app_colors.dart';

class UserTileUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(color: AppColors.COR_PALLETA[300]);

    return ListTile(
      title: Text(
        "Titulo do produto",
        style: TextStyle(color: AppColors.COR_PRIMARIA),
      ),
      subtitle: Text(
        'Sub-titulo do produto',
        style: textStyle,
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Pedidos: 0",
            style: textStyle,
          ),
          Text(
            "Gastos: R\$ 0",
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
