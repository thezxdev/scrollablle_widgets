import 'package:flutter/material.dart';

import '../models/models.dart';
import 'components.dart';



class RecipesGridView extends StatelessWidget {

  final List<SimpleRecipe> recipes;

  const RecipesGridView({
    super.key,
    required this.recipes
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16
      ),
      child: GridView.builder(
        itemCount: recipes.length,
        gridDelegate: // Cuantas columnas
          // const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
          const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 500),
        itemBuilder: (_, index) { // _ = context 
          final simpleRecipe = recipes[index];
          return RecipeThumbnail(
            recipe: simpleRecipe
          );
        }
      ),
    );
  }
}