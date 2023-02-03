import 'package:deliveryapplication/ReusableWidgets/app_drawer.dart';
import 'package:deliveryapplication/ReusableWidgets/textDivider.dart';
import 'package:deliveryapplication/providers/products.dart';
import 'package:deliveryapplication/screens/product_detail_screen.dart';
import 'package:deliveryapplication/utils/Styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsOverviewScreen extends StatelessWidget {
  static const routeName = 'product-overview';

  // double elevation = 4.0;
  //
  // double scale = 1.0;
  //
  // Offset translate = const Offset(0, 0);

  const ProductsOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context).items;
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'My Shop',
      )),
      drawer: const AppDrawer(),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            //slider

            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                      image: NetworkImage(
                          'https://img.freepik.com/free-vector/delivery-staff-ride-motorcycles-shopping-concept_1150-34879.jpg?w=900&t=st=1675192774~exp=1675193374~hmac=550ebdd4f806a9bf1bcb23d448e9378056dfe38518c041ce60baa811c244af9f'),
                      fit: BoxFit.cover)),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30)),
                  gradient:
                      LinearGradient(begin: Alignment.bottomRight, colors: [
                    Colors.black.withOpacity(.7),
                    Colors.black.withOpacity(.8),
                  ]),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    const Text(
                      "Up to 60%",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 50,
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Center(
                          child: Text(
                        "Great Offers",
                        style: Styles.textH3,
                      )),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
            TextDivider(txt: 'Order today'),
            Flexible(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2,
                ),
                padding: const EdgeInsets.all(10.0),
                itemCount: productsData.length,
                itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                  // builder: (c) => products[i],
                  value: productsData[i],
                  child: Card(
                    // color: Colors.transparent,
                    elevation: 0,
                    child: InkWell(
                      onTap: () {
                        // print(productsData[i].title);
                        Navigator.of(context).pushNamed(
                          ProductDetailScreen.routeName,
                          arguments: productsData[i].id,
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: NetworkImage(productsData[i].imageUrl),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
