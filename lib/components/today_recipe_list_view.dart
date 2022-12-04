
import 'package:flutter/material.dart';

import '../components/components.dart';
import '../models/models.dart';


class TodayRecipeListView extends StatelessWidget {

  final List<ExploreRecipe> recipes;

  const TodayRecipeListView({
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recipes of the Day',
            style: Theme.of(context).textTheme.headline1,
          ),
          const SizedBox(height: 16,),
          Container(
            height: 400,
            color: Colors.transparent,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: recipes.length,
              separatorBuilder: (context, index) => const SizedBox(width: 16,),
              itemBuilder: (context, index) {
                final recipe = recipes[index];
                return _buildCard(recipe);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCard(ExploreRecipe recipe) {
    if( recipe.cardType == RecipeCardType.card1 ) {
      return Card1(recipe: recipe);
    }
    if( recipe.cardType == RecipeCardType.card2 ) {
      return Card2(recipe: recipe);
    }
    if( recipe.cardType == RecipeCardType.card3 ) {
      return Card3(recipe: recipe);
    }
    throw Exception('This card doesn\'t exist yet');
  }
}