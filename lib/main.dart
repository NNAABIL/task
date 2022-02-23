import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/cubit/orders_cubit.dart';
import 'package:flutter_task/view/home/homeScreen.dart';
import 'package:flutter_task/view/homeLayout.dart';
import 'package:flutter_task/view/orderChart/orderChart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>OrdersCubit()..getOrders())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:  HomeLayout(),
      ),
    );
  }
}


