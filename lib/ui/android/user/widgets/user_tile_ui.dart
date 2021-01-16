import 'package:flutter/material.dart';
import 'package:gerenciadorloja_app/ui/themes/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class UserTileUI extends StatelessWidget {
  final Map<String, dynamic> user;

  const UserTileUI({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(color: AppColors.COR_PALLETA[300]);

    if (user.containsKey("money"))
      return ListTile(
        title: Text(
          user["name"],
        ),
        subtitle: Text(
          user["email"],
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Pedidos: ${user["orders"]}"
            ),
            Text(
              "Gasto: R\$${user["money"].toStringAsFixed(2)}",
            ),
          ],
        ),
      );
    else
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 200,
              height: 20,
              child: Shimmer.fromColors(
                  child: Container(
                    color: Colors.white.withAlpha(50),
                    margin: EdgeInsets.symmetric(vertical: 4),
                  ),
                  baseColor: Colors.white,
                  highlightColor: Colors.grey),
            ),
            SizedBox(
              width: 50,
              height: 20,
              child: Shimmer.fromColors(
                  child: Container(
                    color: Colors.white.withAlpha(50),
                    margin: EdgeInsets.symmetric(vertical: 4),
                  ),
                  baseColor: Colors.white,
                  highlightColor: Colors.grey),
            )
          ],
        ),
      );
  }
}
