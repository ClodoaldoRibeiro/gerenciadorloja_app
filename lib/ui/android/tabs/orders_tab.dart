import 'package:flutter/material.dart';
import 'package:gerenciadorloja_app/ui/android/widgets/orders_tile.dart';

class OrdersTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: ListView.builder(
        itemCount: 30,
        itemBuilder: (context, index) {
          return OrdersTile();
        },
      ),
    );
  }
}
