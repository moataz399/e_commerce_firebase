import 'package:flutter/material.dart';

import 'order_card.dart';

class CurrentOrdersList extends StatelessWidget {
  const CurrentOrdersList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context,index){
          return OrderCard();
        });
  }
}
