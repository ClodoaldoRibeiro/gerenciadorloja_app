import 'package:flutter/material.dart';
import 'package:gerenciadorloja_app/ui/themes/app_colors.dart';

class WithoutCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.category_outlined,
          size: 130,
          color: AppColors.COR_PRIMARIA,
        ),
        Text(
          'Nenhuma categoria encontrado',
          style: TextStyle(color: AppColors.COR_PALLETA[300]),
        ),
      ],
    );
  }
}
