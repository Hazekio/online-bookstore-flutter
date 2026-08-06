import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../pages/home.dart';
import '../pages/books.dart';
import '../pages/cart.dart';
import '../pages/profile.dart';
import '../services/cart_service.dart';

class MainScreen extends StatefulWidget{
  const MainScreen({super.key});

  @override
  State <MainScreen> createState() => _MainScreenState();

}

class _MainScreenState extends State<MainScreen>{
  final pages = const[
    HomePage(),
    BooksPage(),
    CartPage(),
    ProfilePage()
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context){
    final cartService = context.watch<CartService>();

    return Scaffold(
      body: pages[currentIndex],

      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
      
      onDestinationSelected: (index){
        setState(() {
          currentIndex = index;
        });
      },
      destinations: [

        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label:"Home",
        ),

        NavigationDestination(
          icon: Icon(Icons.menu_book_outlined),
          selectedIcon: Icon(Icons.menu_book),
          label:"Books",
        ),

        NavigationDestination(
          icon: Badge(
            isLabelVisible: cartService.itemCount > 0,
            label: Text(cartService.itemCount.toString()),
            child: Icon(Icons.shopping_cart_outlined),
          ),
          selectedIcon: Badge(
            isLabelVisible: cartService.itemCount > 0,
            label: Text(cartService.itemCount.toString()),
            child: Icon(Icons.shopping_cart),
          ),
            label:"Cart",
          ),

        NavigationDestination(
          icon: Icon(Icons.person_outlined),
          selectedIcon: Icon(Icons.person),
          label:"Profile",
        ),
      ],
      ),
    );
  }
 
}