import 'package:flutter/material.dart';

import 'order_card.dart';

class PastOrdersList extends StatelessWidget {
  const PastOrdersList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 2,
        itemBuilder: (context,index){
          return OrderCard();
        });
  }
}
