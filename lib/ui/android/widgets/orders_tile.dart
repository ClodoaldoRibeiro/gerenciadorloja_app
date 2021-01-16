import 'package:flutter/material.dart';
import 'package:gerenciadorloja_app/ui/themes/app_colors.dart';

class OrdersTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16, horizontal: 4),
      child: Card(
        child: ExpansionTile(
          title: Text(
            'Pedido: 1210074656',
            style: TextStyle(color: Colors.green, fontWeight: FontWeight.w700),
          ),
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        title: Text('Camiseta Preta M'),
                        subtitle: Text('Produto de qualidade'),
                        trailing: Text('2'),
                        contentPadding: EdgeInsets.zero,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FlatButton(
                            textColor: Colors.redAccent,
                            onPressed: () {},
                            child: Text('Excluir'),
                          ),
                          FlatButton(onPressed: () {}, child: Text('Regredir')),
                          FlatButton(
                            textColor: Colors.green,
                            onPressed: () {},
                            child: Text('Avançar'),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
