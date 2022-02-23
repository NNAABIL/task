import 'package:flutter/material.dart';
import 'package:flutter_task/model/orderModel.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({Key key, this.order}) : super(key: key);
  final Order order;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Order id : '),
                Text(order.id),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Text('Order price : '),
                Text(order.price),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Text('Order status : '),
                Text(order.status),
              ],
            )
          ],
        ),
      ),
    );
  }
}
