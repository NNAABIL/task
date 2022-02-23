import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/cubit/orders_cubit.dart';

import 'orderCard.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<OrdersCubit, OrdersState>(
        listener: (context, state) {},
        builder: (context, state) {
          var orderData = OrdersCubit.get(context);
          if (orderData.orderModel != null) {
            return ListView(
              padding: EdgeInsets.all(20),
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'total order count = ${orderData.orderModel.orders.length}',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ],
                        ),
                        Text(
                          'price average = ${orderData.priceAverage()}',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Text(
                          'returned orders = ${orderData.getReturnedOrders()}',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )
                      ],
                    )),
                SizedBox(height: 20,),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: orderData.orderModel.orders.length,
                    itemBuilder: (context, i) {
                      return OrderCard(
                        order: orderData.orderModel.orders[i],
                      );
                    }),
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
