import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget{

  final String title;

  const AppBarWidget({
    super.key,
    required this.title,
    });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        title,
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
        ),
      ),
      actions: const [
      Padding(
          padding: EdgeInsets.only(right: 16),
          child: Icon(Icons.notifications_none,
              color: Colors.black),
      )
      ],
    );
    
  }

  @override
  Size get preferredSize =>const Size.fromHeight(kToolbarHeight);

}