import 'package:flutter/material.dart';

import '../models/books_model.dart';

class CartService extends ChangeNotifier{

  final List<CartItem> cart = [];

  void addBook(Book book){

    final index = cart.indexWhere(
      (item) =>item.book.id == book.id
      );

    if(index != -1){
      cart[index].quantity++;
    }else{
      cart.add(CartItem(book: book));
    }
    notifyListeners();
  }

  void removeBook(Book book) {
    
    cart.removeWhere(
      (item) => item.book.id == book.id,
    );
    notifyListeners();
  }

  //function to manage total amount
  double get total => cart.fold( 0, (sum, item) => sum + item.subtotal,);
  int get itemCount => cart.length;
  bool get isEmpty => cart.isEmpty;

  void increaseQuantity(CartItem item) {
    item.quantity++;
    notifyListeners();
  }

  void decreaseQuantity(CartItem item) {
    if (item.quantity > 1) {
      item.quantity--;
    } else {
      cart.remove(item);
    }
    notifyListeners();
  }

  void clearCart() {
    cart.clear();
    notifyListeners();
  }


}

class CartItem{
  final Book book;
  int quantity;

  CartItem({
    required this.book,
    this.quantity = 1
  });

  double get subtotal => book.price * quantity;
}