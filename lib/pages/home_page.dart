import 'package:flutter/material.dart';
import 'package:shopping_catalog/widgets/my_drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int days = 30;

    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog app"),
      ),
      body: Center(
        child: Container(
          child: Text('Welcome to the $days days of flutter'),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
