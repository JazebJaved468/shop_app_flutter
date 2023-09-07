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
  num result = 2.00;
  return result;
}
