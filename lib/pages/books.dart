import 'package:flutter/material.dart';
import '../models/books_model.dart';
import '../widgets/book_card.dart';
import '../widgets/app_bar.dart';
import '../widgets/search_bar.dart';

class BooksPage extends StatelessWidget{
  const BooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: 'Books'),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SearchBox(),
            Categories(),
            Expanded(
              child: Books()
            )
          ],
        )
      )
    );
    
  }

}

//create a class for categories (genres)
class Categories extends StatelessWidget{
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    var categories= ["All", "Science Fiction", "Mystery", "Coming of Age", "Romance", "Contemporary Fiction", "Cozy Crime", "Literary Fiction", "Philosophical Fiction", "Adventure", "Historical Fiction", "Magical Realism", "African Literature", "Non-fiction", "Non-fiction", "History", "African Literature", "Psychological Fiction", "Self-Help", "Philosophy", "Dystopian Fiction"];
    return SizedBox(
            height: 45,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index){
                return Padding(
                  padding: const EdgeInsets.only(right:10),
                  child: ChoiceChip(label: Text(categories[index]), selected: index ==0, onSelected: (_) {}),
                );
              }
            )
    );
  }
}

//books
class Books extends StatelessWidget{
  const Books({super.key});

  @override
  Widget build(BuildContext context){
    
    return ListView.builder(
      itemCount: books.length,
      itemBuilder: (context, index){
        return BookCard(
          book: books[index],
        );
      },
    );
  }
}