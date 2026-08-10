import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/bottom_nav.dart';
import 'services/cart_service.dart';
import 'services/auth_service.dart';

void main() {
   runApp(
    MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => CartService(),
      ),
      ChangeNotifierProvider(
        create: (_) => AuthService(),
      ),
    ],
    child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Book Nook',
      theme: ThemeData(
        useMaterial3:true,
        colorSchemeSeed: Colors.indigo,
        scaffoldBackgroundColor: const Color(0xFFF8F9FB),
      ),
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
    );
  }
}

