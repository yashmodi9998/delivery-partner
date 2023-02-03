import 'package:deliveryapplication/providers/cart.dart';
import 'package:deliveryapplication/screens/cart_screen.dart';
import 'package:deliveryapplication/utils/Styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  const ProductDetailScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final productId =
        ModalRoute.of(context)!.settings.arguments as String; // is the id!
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productId);
    final cart = Provider.of<Cart>(context, listen: false);
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(children: [
              Stack(children: [
                Stack(
                  children: [
                    //image
                    Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50))),
                      height: size.height * 0.5,
                      width: size.width,
                      child: Image.network(
                        loadedProduct.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    //shadow
                    Container(
                      height: size.height * 0.5,
                      width: size.width,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: const [0.0, 0.4],
                          colors: [
                            Colors.black.withOpacity(0.9),
                            Colors.black.withOpacity(0.0),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SafeArea(
                  child: Column(children: [
                    //back arrow
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //change
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.25,
                    ),
                    SizedBox(
                      height: 500,
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: Container(
                              height: 500,
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 30),
                              decoration: const ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(40),
                                    topRight: Radius.circular(40),
                                  ),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  //title
                                  Text(
                                    loadedProduct.title,
                                    style: Styles.texttitle,
                                  ),
                                  const Divider(
                                    thickness: 0.8,
                                  ),
                                  //Description txt
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Text(
                                      loadedProduct.description,
                                      style: Styles.textH3.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Divider(
                                      color: Styles.placeholder,
                                      thickness: 1.5,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),

                                  SizedBox(
                                    height: 200,
                                    width: double.infinity,
                                    child: Stack(
                                      children: [
                                        //decoration
                                        Container(
                                          width: size.width / 2,
                                          decoration: const ShapeDecoration(
                                            color: Styles.orange,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(40),
                                                bottomRight:
                                                    Radius.circular(40),
                                              ),
                                            ),
                                          ),
                                        ),

                                        //cart
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 20,
                                            ),
                                            child: Container(
                                              height: 160,
                                              width: double.infinity,
                                              margin: const EdgeInsets.only(
                                                left: 50,
                                                right: 40,
                                              ),
                                              decoration: ShapeDecoration(
                                                shape:
                                                    const RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(40),
                                                    bottomLeft:
                                                        Radius.circular(40),
                                                    topRight:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10),
                                                  ),
                                                ),
                                                shadows: [
                                                  BoxShadow(
                                                    color: Styles.placeholder
                                                        .withOpacity(0.3),
                                                    offset: const Offset(0, 5),
                                                    blurRadius: 5,
                                                  ),
                                                ],
                                                color: Colors.white,
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    " Price",
                                                    style: Styles.textH3
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                  ),
                                                  Text(
                                                      '\$${loadedProduct.price}',
                                                      style: Styles.textH2
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
                                                  const SizedBox(height: 10),
                                                  SizedBox(
                                                    width: 130,
                                                    child: FilledButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pushReplacementNamed(
                                                                CartScreen
                                                                    .routeName);
                                                      },
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: const [
                                                          Icon(
                                                            Icons.list,
                                                            color: Styles
                                                                .btntxtColor,
                                                          ),
                                                          Text(
                                                            'View Items',
                                                            style: TextStyle(
                                                                color: Styles
                                                                    .btntxtColor),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            right: 20,
                                          ),
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Container(
                                              width: 60,
                                              height: 60,
                                              decoration: ShapeDecoration(
                                                color: Colors.white,
                                                shadows: [
                                                  BoxShadow(
                                                    color: Styles.placeholder
                                                        .withOpacity(0.3),
                                                    offset: const Offset(0, 5),
                                                    blurRadius: 5,
                                                  ),
                                                ],
                                                shape: const CircleBorder(),
                                              ),
                                              child: IconButton(
                                                  onPressed: () {
                                                    const snackdemo = SnackBar(
                                                      duration: Duration(
                                                          seconds: 1,
                                                          milliseconds: 500),
                                                      content: Opacity(
                                                        opacity: .5,
                                                        child: Center(
                                                          child: Text(
                                                            'Item added to the list',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      backgroundColor:
                                                          Colors.black,
                                                      elevation: 10,
                                                      behavior: SnackBarBehavior
                                                          .floating,
                                                      margin: EdgeInsets.all(5),
                                                    );
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                            snackdemo);
                                                    cart.addItem(
                                                        loadedProduct.id,
                                                        loadedProduct.price,
                                                        loadedProduct.title);
                                                  },
                                                  icon: const Icon(
                                                    Icons.add_shopping_cart,
                                                    color: Styles.orange,
                                                  )),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 20,
                            ),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                  width: 60,
                                  height: 60,
                                  // color: Colors.white,
                                  child: const CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: Icon(
                                        Icons.favorite,
                                        color: Styles.orange,
                                      ))),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ]),
            ]),
          )
        ],
      ),
    );
  }
}
