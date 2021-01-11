import 'package:flutter/material.dart';
import 'package:gerenciadorloja_app/ui/themes/app_colors.dart';

class UserTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
          child: TextField(
            style: TextStyle(color: AppColors.COR_PRIMARIA),
            decoration: InputDecoration(
                hintText: "Pesquisar",
                hintStyle: TextStyle(color: AppColors.COR_PRIMARIA),
                icon: Icon(
                  Icons.search_outlined,
                  color: AppColors.COR_PRIMARIA,
                ),
                border: InputBorder.none),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      "Teste ${index}",
                      style: TextStyle(color: AppColors.COR_PRIMARIA),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    color: AppColors.COR_PRIMARIA,
                  );
                },
                itemCount: 30),
          ),
        )
      ],
    );
  }
}
