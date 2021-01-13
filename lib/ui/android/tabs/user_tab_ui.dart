import 'package:flutter/material.dart';
import 'package:gerenciadorloja_app/ui/android/widgets/user_tile_ui.dart';
import 'package:gerenciadorloja_app/ui/themes/app_colors.dart';

class UserTabUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(color: AppColors.COR_PRIMARIA);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
          child: TextField(
            style: textStyle,
            decoration: InputDecoration(
                hintText: "Pesquisar",
                hintStyle: textStyle,
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
                  return UserTileUI();
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    color: AppColors.COR_PALLETA[200],
                  );
                },
                itemCount: 100),
          ),
        )
      ],
    );
  }
}
