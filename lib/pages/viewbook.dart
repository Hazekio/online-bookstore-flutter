import 'package:flutter/material.dart';
import '../models/books_model.dart';

class ViewBookPage extends StatelessWidget {
  final Book book;

  const ViewBookPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.name), 
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Book Image
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  book.image,
                  height: 250,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 250,
                    width: 170,
                    color: Colors.grey.shade300,
                    child: const Icon(Icons.book, size: 80, color: Colors.grey),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Book Title
            Text(
              book.name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),

            // Author & Genre
            Text(
              "By ${book.author}",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 8),
            Chip(
              label: Text(
                book.genre,
                style: const TextStyle(fontSize: 12),
              ),
              backgroundColor: Colors.purple.shade50,
              padding: EdgeInsets.zero,
            ),
            const SizedBox(height: 16),

            // Rating & Price Badge
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 22),
                const SizedBox(width: 4),
                Text(
                  '${book.rating}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                Text(
                  'Kes ${book.price.toInt()}',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // About / Long Description
            const Text(
              "About this book",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              book.longDescription, 
              style: TextStyle(
                fontSize: 15,
                height: 1.5,
                color: Colors.grey.shade800,
              ),
            ),
          ],
        ),
      ),

      // Bottom Add to Cart Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.shopping_cart_outlined),
          label: const Text("Add to Cart"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }
}