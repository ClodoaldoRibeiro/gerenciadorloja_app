import 'package:flutter/material.dart';
import 'package:gerenciadorloja_app/ui/themes/app_colors.dart';

class EmptyListOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.remove_shopping_cart,
          size: 130,
          color: AppColors.COR_PRIMARIA,
        ),
        Text(
          'Nenhum pedidos encontrado',
          style: TextStyle(color: AppColors.COR_PALLETA[300]),
        ),
      ],
    );
  }
}
