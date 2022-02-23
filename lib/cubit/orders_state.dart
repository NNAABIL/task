part of 'orders_cubit.dart';

@immutable
abstract class OrdersState {}

class OrdersInitial extends OrdersState {}
class OrdersLoadingState extends OrdersState {}
class OrdersSuccessState extends OrdersState {
  final OrderModel orderModel;

  OrdersSuccessState(this.orderModel);

}
class OrdersErrorState extends OrdersState {}
class ChangeBottomNavState extends OrdersState {}
