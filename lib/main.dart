import 'package:deliveryapplication/controller/AuthController.dart';
import 'package:deliveryapplication/controller/notification_service.dart';
import 'package:deliveryapplication/providers/cart.dart';
import 'package:deliveryapplication/providers/orders.dart';
import 'package:deliveryapplication/providers/products.dart';
import 'package:deliveryapplication/screens/cart_screen.dart';
import 'package:deliveryapplication/screens/login_page.dart';
import 'package:deliveryapplication/screens/orders_screen.dart';
import 'package:deliveryapplication/screens/product_detail_screen.dart';
import 'package:deliveryapplication/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProvider.value(
          value: Orders(),
        ),
      ],
      child: GetMaterialApp(
          title: 'Delivery Partner',
          theme: ThemeData(
            primarySwatch: Colors.deepOrange,
          ),
          home: LoginPage(),
          debugShowCheckedModeBanner: false,
          routes: {
            ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
            CartScreen.routeName: (ctx) => CartScreen(),
            OrdersScreen.routeName: (ctx) => OrdersScreen(),
          }),
    );
  }
}
