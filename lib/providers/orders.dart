import 'package:deliveryapplication/ReusableWidgets/order_item.dart';
import 'package:deliveryapplication/providers/cart.dart';
import 'package:flutter/foundation.dart';

class Order {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;
  String orderStatus;
  Order({
    required this.id,
    required this.amount,
    required this.products,
    required this.dateTime,
    required this.orderStatus,
  });
}

class Orders with ChangeNotifier {
  List<Order> _orders = [];

  List<Order> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartProducts, double total) {
    _orders.insert(
      0,
      Order(
          id: DateTime.now().toString(),
          amount: total,
          dateTime: DateTime.now(),
          products: cartProducts,
          orderStatus: 'pending'),
    );
    notifyListeners();
  }

  void removeItem(String productId) {
    _orders.remove(productId);
    notifyListeners();
  }

  void updateOrderStatus(String id, String newStatus) {
    Order order = _orders.firstWhere((order) => order.id == id);
    order.orderStatus = newStatus;
    notifyListeners();
  }
}
