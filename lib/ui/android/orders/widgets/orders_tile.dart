import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'order_header.dart';

class OrdersTile extends StatelessWidget {
  final DocumentSnapshot order;

  OrdersTile(this.order);

  final states = [
    "",
    "Em preparação",
    "Em transporte",
    "Aguardando Entrega",
    "Entregue"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16, horizontal: 4),
      child: Card(
        child: ExpansionTile(
          title: Text(
            "#${order.documentID.substring(order.documentID.length - 7, order.documentID.length)} - "
            "${states[order.data["status"]]}",
            style: TextStyle(
                color: order.data["status"] != 4
                    ? Colors.grey[850]
                    : Colors.green),
          ),
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: order.data["products"].map<Widget>((p) {
                      return ListTile(
                        title: Text(p["product"]["title"] + " " + p["size"]),
                        subtitle: Text(p["category"] + "/" + p["pid"]),
                        trailing: Text(
                          p["quantity"].toString(),
                          style: TextStyle(fontSize: 20),
                        ),
                        contentPadding: EdgeInsets.zero,
                      );
                    }).toList(),
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
