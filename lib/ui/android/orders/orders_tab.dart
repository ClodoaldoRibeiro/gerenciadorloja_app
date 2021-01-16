import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:gerenciadorloja_app/blocs/orders_bloc.dart';
import 'package:gerenciadorloja_app/ui/android/orders/widgets/empty_list_orders.dart';

import 'widgets/orders_tile.dart';

class OrdersTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _ordersBloc = BlocProvider.of<OrdersBloc>(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: StreamBuilder<List>(
          stream: _ordersBloc.outOrders,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return EmptyListOrders();
            } else if (snapshot.data.length == 0) {
              return EmptyListOrders();
            }
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return OrdersTile(snapshot.data[index]);
              },
            );
          }),
    );
  }
}
