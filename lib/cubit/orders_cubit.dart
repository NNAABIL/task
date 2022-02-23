import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/model/orderModel.dart';
import 'package:flutter_task/model/orderSales.dart';
import 'package:flutter_task/view/home/homeScreen.dart';
import 'package:flutter_task/view/orderChart/orderChart.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitial());

  static OrdersCubit get(context) => BlocProvider.of(context);



  int currentIndex = 0;

  changeCurrentIndex(index) {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }

  final List<Widget> widgetOptions = [
    HomeScreen(),
    OrderChart(),
  ];
  final List<String> widgetOptionsName = [
    'Orders',
    'Charts',
  ];

  OrderModel orderModel;

  Future<void> getOrders() async {
    emit(OrdersLoadingState());
    await rootBundle.loadString('assets/orders.json').then((value) {
      orderModel = OrderModel.fromJson(json.decode(value));

      emit(OrdersSuccessState(orderModel));
    }).catchError((error) {
      print(error.toString());
      emit(OrdersErrorState());
    });
  }

  int getReturnedOrders() {
    List<Order> returnedOrders = [];
    returnedOrders = orderModel.orders
        .where((element) => element.status == 'RETURNED')
        .toList();
    return returnedOrders.length;
  }

  double priceAverage() {
    double totalOrderPrice = 0;
    double average = 0;
    orderModel.orders.forEach((element) {
      print(double.parse(
          element.price.substring(1, 9).replaceAll(RegExp(",|!|'"), "")));
      totalOrderPrice += double.parse(
          element.price.substring(1, 9).replaceAll(RegExp(",|!|'"), ""));
      average = totalOrderPrice / orderModel.orders.length;
    });
    print(average);
    return average;
  }

  int monthOne() {
    int index = 0;
    index = orderModel.orders
        .where((element) => element.registered[6] == '1')
        .toList()
        .length;
    return index;
  }

  int monthTwo() {
    int index = 0;
    index = orderModel.orders
        .where((element) => element.registered[6] == '2')
        .toList()
        .length;
    return index;
  }

  int monthThree() {
    int index = 0;
    index = orderModel.orders
        .where((element) => element.registered[6] == '3')
        .toList()
        .length;
    return index;
  }

  int monthFour() {
    int index = 0;
    index = orderModel.orders
        .where((element) => element.registered[6] == '4')
        .toList()
        .length;
    return index;
  }

  int monthFive() {
    int index = 0;
    index = orderModel.orders
        .where((element) => element.registered[6] == '5')
        .toList()
        .length;
    return index;
  }

  int monthSix() {
    int index = 0;
    index = orderModel.orders
        .where((element) => element.registered[6] == '6')
        .toList()
        .length;
    return index;
  }

  int monthSeven() {
    int index = 0;
    index = orderModel.orders
        .where((element) => element.registered[6] == '7')
        .toList()
        .length;
    return index;
  }

  int monthEight() {
    int index = 0;
    index = orderModel.orders
        .where((element) => element.registered[6] == '8')
        .toList()
        .length;
    return index;
  }

  int monthNine() {
    int index = 0;
    index = orderModel.orders
        .where((element) => element.registered[6] == '9')
        .toList()
        .length;
    return index;
  }

  int monthTen() {
    int index = 0;
    index = orderModel.orders
        .where((element) => element.registered[6] == '10')
        .toList()
        .length;
    return index;
  }

  int monthEleven() {
    int index = 0;
    index = orderModel.orders
        .where((element) => element.registered[6] == '11')
        .toList()
        .length;
    return index;
  }

  int monthTwelve() {
    int index = 0;
    index = orderModel.orders
        .where((element) => element.registered[6] == '12')
        .toList()
        .length;
    return index;
  }

  List<OrderSales> orderSales() {
    print(monthOne());
    print(monthOne());
    print(monthOne());
    return [
      OrderSales(orders: monthOne(), month: 1),
      OrderSales(orders: monthTwo(), month: 2),
      OrderSales(orders: monthThree(), month: 3),
      OrderSales(orders: monthFour(), month: 4),
      OrderSales(orders: monthFive(), month: 5),
      OrderSales(orders: monthSix(), month: 6),
      OrderSales(orders: monthSeven(), month: 7),
      OrderSales(orders: monthEight(), month: 8),
      OrderSales(orders: monthNine(), month: 9),
      OrderSales(orders: monthTen(), month: 10),
      OrderSales(orders: monthEleven(), month: 11),
      OrderSales(orders: monthTwelve(), month: 12),
    ];
  }
}
