import 'dart:math';
import 'package:deliveryapplication/ReusableWidgets/textDivider.dart';
import 'package:deliveryapplication/utils/Styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../providers/orders.dart';

class OrderItem extends StatefulWidget {
  final Order order;

  OrderItem(this.order, {super.key});

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _expanded = false;
  bool _showWidget = true;
  @override
  Widget build(BuildContext context) {
    final orderManage = Provider.of<Orders>(context, listen: false);
    // product.updateDeliveryMessage('On the way');

    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: widget.order.orderStatus.contains('complete')
                ? const Icon(
                    Icons.check_box,
                    color: Colors.green,
                  )
                : const Icon(
                    Icons.timeline_outlined,
                    color: Colors.red,
                  ),
            title: Text(
              '\$${widget.order.amount}',
              style: Styles.textH2,
            ),
            subtitle: Text(
              DateFormat('dd/MM/yyyy  hh:mm ').format(widget.order.dateTime),
            ),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                  height: min(widget.order.products.length * 20.0 + 10, 100),
                  child: ListView(
                    children: widget.order.products
                        .map(
                          (prod) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                prod.title,
                                style: Styles.textH2.copyWith(
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 3),
                              ),
                              Text(
                                '${prod.quantity}x \$${prod.price}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      'Order Status: ',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      widget.order.orderStatus,
                      style: const TextStyle(fontSize: 18, color: Colors.green),
                    ),
                    const Divider(),
                  ],
                ),
                widget.order.orderStatus.contains('pending')
                    ? InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Are you sure?'),
                              content:
                                  const Text('You have delivered the order'),
                              actions: [
                                GestureDetector(
                                  child: const Text('No'),
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                GestureDetector(
                                  child: const Text('Yes'),
                                  onTap: () {
                                    Navigator.of(context).pop();
                                    setState(() {
                                      orderManage.updateOrderStatus(
                                          widget.order.id, 'complete');
                                    });
                                    _showWidget = false;
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                        child: const TextDivider(txt: 'Mark as Complete?'),
                      )
                    : const Divider(),
              ],
            )
        ],
      ),
    );
  }
}
