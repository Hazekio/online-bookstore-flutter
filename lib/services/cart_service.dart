import 'package:flutter/material.dart';

import '../models/books_model.dart';

class CartService extends ChangeNotifier{

  final List<Book> cart = [];

  void addBook(Book book){
    cart.add(book);
    notifyListeners();
  }

  void removeBook(Book book) {
    cart.remove(book);
  }

  //function to manage total amount
  double get total {
    double sum = 0;
    for (Book book in cart) {
      sum += book.price;
    }
    return sum;
  }

  int get itemCount => cart.length;
  bool get isEmpty => cart.isEmpty;

  void clearCart() {
    cart.clear();
    notifyListeners();
  }

}