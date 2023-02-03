import 'package:flutter/material.dart';

import './product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Punjabi Dish',
      description:
          'Common ones are chana masala, nan, chole kulche, aloo paratha, panner paratha, gobi paratha, paratha with curd, paratha with butter, halwa poori, bhatoora.',
      price: 29.99,
      imageUrl:
          'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
    ),
    Product(
        id: 'p2',
        title: 'Chinese dish',
        description:
            'Common ones are chana masala, nan, chole kulche, aloo paratha, panner paratha, gobi paratha, paratha with curd, paratha with butter, halwa poori, bhatoora.',
        price: 59.99,
        imageUrl:
            'https://media.istockphoto.com/id/1149396396/photo/man-holding-kebabs-on-skewers.jpg?s=612x612&w=is&k=20&c=DfI1CAZn0HdavGd2eVsujsTYfsJQvJUroInU8vAjfMw='),
    Product(
      id: 'p3',
      title: 'Grilled Chicken',
      description:
          'Common ones are chana masala, nan, chole kulche, aloo paratha, panner paratha, gobi paratha, paratha with curd, paratha with butter, halwa poori, bhatoora.',
      price: 19.99,
      imageUrl:
          'https://media.istockphoto.com/id/1149397128/photo/homemade-grilled-chicken-on-skewers.jpg?s=612x612&w=is&k=20&c=G6NgJHB5KJpTbSnKEuArNKRhd2ZNw797zBCftaQ0BbU=',
    ),
    Product(
      id: 'p4',
      title: 'Lemon Chicken',
      description:
          'Common ones are chana masala, nan, chole kulche, aloo paratha, panner paratha, gobi paratha, paratha with curd, paratha with butter, halwa poori, bhatoora.',
      price: 49.99,
      imageUrl:
          'https://media.istockphoto.com/id/1189552859/photo/roasted-lemon-chicken-legs-with-chili-sauce-and-sesame-in-cast-iron-pan-on-dark-stone.jpg?s=1024x1024&w=is&k=20&c=D-5kU86eYvLCMC1rbizbHh9Bd73dp-O98INKdOfyV2Y=',
    ),
    Product(
      id: 'p5',
      title: 'Punjabi Dish',
      description:
          'Common ones are chana masala, nan, chole kulche, aloo paratha, panner paratha, gobi paratha, paratha with curd, paratha with butter, halwa poori, bhatoora.',
      price: 29.99,
      imageUrl:
          'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
    ),
    Product(
        id: 'p6',
        title: 'Chinese dish',
        description:
            'Common ones are chana masala, nan, chole kulche, aloo paratha, panner paratha, gobi paratha, paratha with curd, paratha with butter, halwa poori, bhatoora.',
        price: 59.99,
        imageUrl:
            'https://media.istockphoto.com/id/1149396396/photo/man-holding-kebabs-on-skewers.jpg?s=612x612&w=is&k=20&c=DfI1CAZn0HdavGd2eVsujsTYfsJQvJUroInU8vAjfMw='),
    Product(
      id: 'p7',
      title: 'Grilled Chicken',
      description:
          'Common ones are chana masala, nan, chole kulche, aloo paratha, panner paratha, gobi paratha, paratha with curd, paratha with butter, halwa poori, bhatoora.',
      price: 19.99,
      imageUrl:
          'https://media.istockphoto.com/id/1149397128/photo/homemade-grilled-chicken-on-skewers.jpg?s=612x612&w=is&k=20&c=G6NgJHB5KJpTbSnKEuArNKRhd2ZNw797zBCftaQ0BbU=',
    ),
    Product(
      id: 'p8',
      title: 'Lemon Chicken',
      description:
          'Common ones are chana masala, nan, chole kulche, aloo paratha, panner paratha, gobi paratha, paratha with curd, paratha with butter, halwa poori, bhatoora.',
      price: 49.99,
      imageUrl:
          'https://media.istockphoto.com/id/1189552859/photo/roasted-lemon-chicken-legs-with-chili-sauce-and-sesame-in-cast-iron-pan-on-dark-stone.jpg?s=1024x1024&w=is&k=20&c=D-5kU86eYvLCMC1rbizbHh9Bd73dp-O98INKdOfyV2Y=',
    ),
  ];
  var deliveryMsg = 'initiated to delivery';

  void updateDeliveryMessage(String newMessage) {
    deliveryMsg = newMessage;
    notifyListeners();
  }

  List<Product> get items {
    return [..._items];
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  void addProduct() {
    // _items.add(value);
    notifyListeners();
  }
}
