import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/cubit/orders_cubit.dart';


class HomeLayout extends StatelessWidget {
  const HomeLayout({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrdersCubit, OrdersState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        final orderData = OrdersCubit.get(context);
        return SafeArea(
          child: Scaffold(

            body: orderData.widgetOptions[orderData.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: orderData.currentIndex,
              type: BottomNavigationBarType.fixed,
              onTap: (int index) {
                orderData.changeCurrentIndex(index);
              },
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.show_chart),label: 'Charts'),
              ],
            ),
          ),
        );
      },
    );
  }
}
