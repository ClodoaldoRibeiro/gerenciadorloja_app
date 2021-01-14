import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:gerenciadorloja_app/blocs/user_bloc.dart';
import 'package:gerenciadorloja_app/ui/android/widgets/user_tile_ui.dart';
import 'package:gerenciadorloja_app/ui/themes/app_colors.dart';

class UserTabUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _userBLoC = BlocProvider.of<UserBLoC>(context);
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
            onChanged: _userBLoC.onChangedSearch,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
            child: StreamBuilder<List>(
                stream: _userBLoC.outUsers,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: Column(
                        children: [
                          Icon(
                            Icons.person_search_outlined,
                            size: 130,
                            color: AppColors.COR_PRIMARIA,
                          ),
                          Text(
                            'Não há clientes...',
                            style: TextStyle(color: AppColors.COR_PALLETA[300]),
                          ),
                        ],
                      ),
                    );
                  } else if (snapshot.data.length == 0) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off_outlined,
                          size: 130,
                          color: AppColors.COR_PRIMARIA,
                        ),
                        Text(
                          'Nemhum dado encontrado',
                          style: TextStyle(color: AppColors.COR_PALLETA[300]),
                        ),
                      ],
                    );
                  } else {
                    return ListView.separated(
                        itemBuilder: (context, index) {
                          return UserTileUI(
                            user: snapshot.data[index],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider(
                            color: AppColors.COR_PALLETA[200],
                          );
                        },
                        itemCount: snapshot.data.length);
                  }
                }),
          ),
        )
      ],
    );
  }
}
