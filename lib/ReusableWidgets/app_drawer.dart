import 'package:deliveryapplication/screens/cart_screen.dart';
import 'package:deliveryapplication/screens/orders_screen.dart';
import 'package:deliveryapplication/screens/products_overview_screen.dart';
import 'package:deliveryapplication/utils/Styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: const Text(
              'Hello Friend!',
            ),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.shopping_bag,
              color: Styles.iconColor,
            ),
            title: const Text('Products'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ProductsOverviewScreen()));
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.shopping_cart, color: Styles.iconColor),
            title: const Text('Cart'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(CartScreen.routeName);
            },
          ),
          const Divider(),
          ListTile(
            leading:
                const Icon(Icons.timeline_outlined, color: Styles.iconColor),
            title: const Text('Order Status'),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => OrdersScreen()));
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Styles.iconColor),
            title: const Text('Log Out'),
            onTap: _logout,
          ),
        ],
      ),
    );
  }

  void _logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
