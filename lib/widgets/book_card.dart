import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/books_model.dart';
import '../pages/viewbook.dart'; 
import '../services/cart_service.dart';

class BookCard extends StatelessWidget {
  final Book book;

  const BookCard({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    // 2. Wrapped Card with InkWell for tap detection
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ViewBookPage(book: book),
          ),
        );
      },
      borderRadius: BorderRadius.circular(12),
      child: Card(
        margin: const EdgeInsets.only(bottom: 15),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  book.image, 
                  width: 90, 
                  height: 130, 
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold, 
                        fontSize: 18,
                      ),
                    ),
                    Text(book.author),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 18),
                        Text(book.rating.toString()),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Kes${book.price.toInt()}",
                      style: const TextStyle(
                        color: Colors.indigo,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    FilledButton(
                      onPressed: () {
                        context.read<CartService>().addBook(book);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("${book.name} added to cart"),
                          ),
                        );
                      }, 
                      child: const Text("Add to Cart"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}