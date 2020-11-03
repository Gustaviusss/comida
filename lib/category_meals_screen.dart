import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;
  final Color color;

  CategoryMealsScreen(this.categoryId, this.categoryTitle, this.color);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Text(categoryTitle),
      ),
      body: Center(
        child: Text('Aqui vai ter comida jaja'),
      ),
    );
  }
}
