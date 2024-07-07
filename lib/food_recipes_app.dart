import 'package:flutter/material.dart';

class FoodRecipesApp extends StatelessWidget {
  const FoodRecipesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Recipes',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Food Recipes'),
        ),
        body: const Center(
          child: Text('Welcome to Food Recipes!'),
        ),
      ),
    );
  }
}
