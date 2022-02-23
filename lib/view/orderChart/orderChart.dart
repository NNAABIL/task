import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/cubit/orders_cubit.dart';
import 'package:flutter_task/model/orderSales.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class OrderChart extends StatefulWidget {
  const OrderChart({Key key}) : super(key: key);

  @override
  State<OrderChart> createState() => _OrderChartState();
}

class _OrderChartState extends State<OrderChart> {
  TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<OrdersCubit, OrdersState>(
    listener: (context, state) {},
    builder: (context, state) {
      final orderData = OrdersCubit.get(context);
      if (OrdersCubit.get(context).orderModel != null) {
        return SfCartesianChart(
          title: ChartTitle(text: 'Monthly Orders analysis'),
          tooltipBehavior: _tooltipBehavior,
          series: <ChartSeries>[
            LineSeries<OrderSales, double>(
                dataSource: orderData.orderSales(),
                xValueMapper: (OrderSales sales, _) => sales.month,
                yValueMapper: (OrderSales sales, _) => sales.orders,
                dataLabelSettings: DataLabelSettings(isVisible: true),
                enableTooltip: true),
          ],
          primaryXAxis:
              NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),
        );
      } else {
        return Center(child: CircularProgressIndicator());
      }
    },
      ),
    );
  }
}
