import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/cart_service.dart';
import '../services/auth_service.dart';
import 'auth/login.dart';
import 'checkout.dart';

class CartPage extends StatefulWidget{
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();

}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartService>();
    return Scaffold(

      appBar: AppBar(
        title: const Text("Cart"),
      ),

      body: Column(

        children: [
          if (cart.isEmpty)
          const Expanded(
            child: Center(
              child: Text(
                "Your cart is empty.",
                style: TextStyle( fontSize: 22 ),
              ),
            ),
          )

          else
          Expanded(
              child: ListView.builder(
                itemCount: cart.itemCount,
  itemBuilder: (context, index) {
    final book = cart.cart[index];

    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      child: ListTile(
        leading: Image.asset(
          book.book.image,
          width: 50,
          fit: BoxFit.cover,
        ),
        title: Text(book.book.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(book.book.author),
            Text(
              "Quantity: ${book.quantity}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [

            IconButton(
              icon: const Icon(Icons.remove_circle_outline),
              onPressed: () {
                context
                    .read<CartService>().decreaseQuantity(book);
              },
            ),

            Text(
              "${book.quantity}",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            IconButton(
              icon: const Icon(Icons.add_circle_outline),
              onPressed: () {
                context
                    .read<CartService>().increaseQuantity(book);
              },
            ),

            const SizedBox(width: 8),

            Text(
              "Kes ${book.subtotal.toStringAsFixed(2)}",
            ),

            IconButton(
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () {
                context
                    .read<CartService>()
                    .removeBook(book.book);
              },
            ),
          ],
        ),
      ),
    );
  },
              ),
            ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              border: Border( top: BorderSide( color: Colors.grey ) ) 
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      const Text( "Items", style: TextStyle( fontSize: 18, ) ),
                      Text( cart.itemCount.toString(), style: const TextStyle( fontSize: 18, ) ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      const Text( "Total", style: TextStyle( fontSize: 22, fontWeight: FontWeight.bold, ), ),

                      Text(
                        "Kes${context.read<CartService>().total.toStringAsFixed(2)}",
                        style: const TextStyle( fontSize: 22, fontWeight: FontWeight.bold, color: Colors.indigo, ) ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed:
                          cart.isEmpty ? null : () {
                            if(!context.watch<AuthService>().isLoggedIn) {
                              showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  title: const Text("Login Required"),
                                  content: const Text(
                                    "Please log in to continue with checkout.",
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Cancel"),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => const LoginPage(),
                                          ),
                                        );
                                      },
                                      child: const Text("Login"),
                                    )
                                  ]
                                )
                              );
                            } else{
                              Navigator.push(context,
                              MaterialPageRoute(builder: (_) => const CheckoutPage()));
                            }
                          }, 
                      child: const Text("Checkout"),
                    ),
                  ),
                ]
              )

          )
        ]
      )
    );
  }
}