import 'package:flutter/material.dart';

class OrderHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Clodoaldo'),
              Text('Rua das Orquidias'),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('Preço produtos'),
            Text('Preço total'),
          ],
        ),
      ],
    );
  }
}
