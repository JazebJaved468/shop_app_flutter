import 'dart:math';

import 'package:shopping_app/data/data.dart';

// Convert String into Sentence Case Function
String toSentenceCase(String text) {
  // ignore: unnecessary_null_comparison
  if (text == null || text.isEmpty) {
    return "";
  }

  // Split the text into words
  List<String> words = text.split(' ');

  // Capitalize the first letter of each word
  List<String> sentenceCaseWords = words.map((word) {
    if (word.isNotEmpty) {
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    } else {
      return "";
    }
  }).toList();

  // Join the words back together with spaces
  String sentenceCaseText = sentenceCaseWords.join(' ');

  return sentenceCaseText;
}

//add to Cart Functionality
void addToCart({
  required int shopIndex,
  required int filterIndex,
  required int productIndex,
}) {
  bool isPresentAlready = false;
  int isPresentAlreadyIndex = 0;

  CartData.data.forEach((item) {
    if (item['shopIndex'] == shopIndex &&
        item['filterIndex'] == filterIndex &&
        item['productIndex'] == productIndex) {
      isPresentAlready = true;
      isPresentAlreadyIndex = CartData.data.indexOf(item);
    }
  });

  if (isPresentAlready == true) {
    CartData.data[isPresentAlreadyIndex]['quantity']++;
    print("dont add");
  } else {
    CartData.data.add({
      'shopIndex': shopIndex,
      'filterIndex': filterIndex,
      'productIndex': productIndex,
      'name': ApiData.data[shopIndex]['products'][filterIndex]['items']
          [productIndex]['name'],
      'price': ApiData.data[shopIndex]['products'][filterIndex]['items']
          [productIndex]['price'],
      'imgPath': ApiData.data[shopIndex]['products'][filterIndex]['items']
          [productIndex]['image'],
      'quantity': 1,
    });
  }
}

//add to Favourites Functionality
void addToFavourite({
  required int shopIndex,
  required int filterIndex,
  required int productIndex,
}) {
  FavouriteData.data.add({
    'shopIndex': shopIndex,
    'filterIndex': filterIndex,
    'productIndex': productIndex,
    'name': ApiData.data[shopIndex]['products'][filterIndex]['items']
        [productIndex]['name'],
    'price': ApiData.data[shopIndex]['products'][filterIndex]['items']
        [productIndex]['price'],
    'imgPath': ApiData.data[shopIndex]['products'][filterIndex]['items']
        [productIndex]['image'],
    'shop': ApiData.data[shopIndex]['name'],
    'rating': ApiData.data[shopIndex]['products'][filterIndex]['items']
        [productIndex]['rating'],
  });
}

//checking Item already added to favourite or not
List isFavouriteAlready({
  required int shopIndex,
  required int filterIndex,
  required int productIndex,
}) {
  bool result = false;
  int isFavouriteAlreadyIndex = 0;

  // ignore: avoid_print
  print(
      "Inside function => shopIndex = ${shopIndex} \n shopIndex = ${shopIndex} \n shopIndex = ${shopIndex} \n");

  for (var item in FavouriteData.data) {
    if (item['shopIndex'] == shopIndex &&
        item['filterIndex'] == filterIndex &&
        item['productIndex'] == productIndex) {
      result = true;
      isFavouriteAlreadyIndex = FavouriteData.data.indexOf(item);
      break;
    }
  }
  // FavouriteData.data.forEach((item) {
  //   if (item['shopIndex'] == shopIndex &&
  //       item['filterIndex'] == filterIndex &&
  //       item['productIndex'] == productIndex) {
  //     result = true;
  //     isFavouriteAlreadyIndex = FavouriteData.data.indexOf(item);
  //   }
  // });

  return [result, isFavouriteAlreadyIndex];
}

//remove from Favourites Functionality
void removeFromFavourite({
  required int shopIndex,
  required int filterIndex,
  required int productIndex,
}) {
  int itemToRemoveIndex = isFavouriteAlready(
      shopIndex: shopIndex,
      filterIndex: filterIndex,
      productIndex: productIndex)[1];
  FavouriteData.data.removeAt(itemToRemoveIndex);
}

// Calculating Sub-total Amount
num getSubtotal() {
  num result = 0;
  CartData.data.forEach((item) {
    result += item['price'] * item['quantity'];
  });
  return result;
}

// Calculating Delivery Amount
num getDeliveryAmount() {
  num result = CartData.data.isNotEmpty ? 50.00 : 0.00;
  return result;
}

// Generating a Unique 6 digit Id for orders
int generateUniqueOrderID() {
  Random random = Random();
  int uniqueNumber = random.nextInt(900000) + 100000;

  // double checking
  List ordersList = PersonalInfo.orders[0]['orders'];
  for (var i = 0; i < ordersList.length; i++) {
    if (uniqueNumber == ordersList[i]['id']) {
      // print("repeated");
      uniqueNumber = generateUniqueOrderID();
      break;
    }
  }

  return uniqueNumber;
}

// Shifting cart items to orders list on successful payment
void shiftCartToOrders() {
  PersonalInfo.orders[0]['orders'].add({
    'id': generateUniqueOrderID(),
    'items': List.from(CartData.data),
  });

  CartData.data.clear();
}

// Removing all items from cart after payment
void clearCart() {
  CartData.data.clear();
}

// Getting Order Subtotal Charges
num getOrderSubtotal() {
  num result = 0;
   PersonalInfo.orders[Selection.orderFilter]['orders']
      [Selection.orderIndex]['items'].forEach((item) {
    result += item['price'] * item['quantity'];
  });
  return result;
}

// Getting Order Delivery Charges
num getOrderDeliveryAmount() {
  num result = 50.00 ;
  return result;
}

