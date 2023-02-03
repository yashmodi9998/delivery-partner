import 'dart:math';

import 'package:deliveryapplication/ReusableWidgets/app_drawer.dart';
import 'package:deliveryapplication/ReusableWidgets/cart_item.dart';
import 'package:deliveryapplication/ReusableWidgets/textDivider.dart';
import 'package:deliveryapplication/controller/notification_service.dart';
import 'package:deliveryapplication/providers/orders.dart';
import 'package:deliveryapplication/providers/products.dart';
import 'package:deliveryapplication/screens/orders_screen.dart';
import 'package:deliveryapplication/utils/Styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart' show Cart;

class CartScreen extends StatefulWidget {
  static const routeName = '/cart';

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      drawer: const AppDrawer(),
      body: Column(
        children: <Widget>[
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: cart.itemCount != 0
                  ? Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              const Text(
                                'Total Amount',
                                style: TextStyle(fontSize: 20),
                              ),
                              const Spacer(),
                              Chip(
                                label: Text(
                                  '\$${cart.totalAmount.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .primaryTextTheme
                                        .titleMedium
                                        ?.color,
                                  ),
                                ),
                                backgroundColor: Theme.of(context).primaryColor,
                              ),
                            ]),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                                child: TextDivider(
                                  txt: 'Accept Order?',
                                ),
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            title: const Text('Are you sure?'),
                                            content: const Text(
                                                'You want to accept this order'),
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
                                                  if (cart.itemCount != 0) {
                                                    Provider.of<Orders>(context,
                                                            listen: false)
                                                        .addOrder(
                                                      cart.items.values
                                                          .toList(),
                                                      cart.totalAmount,
                                                    );
                                                    cart.clear();
                                                    NotificationService()
                                                        .showNotification(
                                                      title:
                                                          'Hey, You have new order!!',
                                                      body:
                                                          'Please, spend a time to complete ',
                                                    );
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                OrdersScreen()));
                                                  }
                                                },
                                              ),
                                            ],
                                          ));
                                })
                          ],
                        ),
                        //start
                        Column(
                          children: <Widget>[
                            ListTile(
                              title: const Text('Delivery Status'),
                              trailing: IconButton(
                                icon: Icon(_expanded
                                    ? Icons.expand_less
                                    : Icons.expand_more),
                                onPressed: () {
                                  setState(() {
                                    _expanded = !_expanded;
                                  });
                                },
                              ),
                            ),
                            if (_expanded)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Consumer<Products>(
                                    builder: (context, products, child) {
                                      products.updateDeliveryMessage(
                                        'Initiated to delivery',
                                      );
                                      return Center(
                                        child: Text(
                                          products.deliveryMsg,
                                          style: Styles.textH2,
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ],
                    )
                  : Container(
                      child: Column(
                      children: [
                        Image.network(
                            'https://media.istockphoto.com/id/1173117709/vector/cupid-with-shopping-cart-illustration.jpg?s=612x612&w=0&k=20&c=rG_lYAxIHe_7eCa6GF-gSTGITKDAFz25T9TWkKhrQfQ='),
                        Text(
                          'You have no orders to accept !!!',
                          style: Styles.btnText,
                        ),
                      ],
                    )),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, i) => CartItem(
                cart.items.values.toList()[i].id,
                cart.items.keys.toList()[i],
                cart.items.values.toList()[i].price,
                cart.items.values.toList()[i].quantity,
                cart.items.values.toList()[i].title,
              ),
            ),
          )
        ],
      ),
    );
  }
}
