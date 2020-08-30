import 'package:flutter/material.dart';
import 'package:meals/components/meal_item.dart';
import 'package:meals/models/meal.dart';

// tela que exibe as refeições marcadas como favoritas

class FavoriteScreen extends StatelessWidget {
  // lista que será passada via construtor
  final List<Meal> favoriteMeals;

  const FavoriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    // não existem favoritos
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('Nenhuma refeições foi marcada como favorita!'),
      );
    }

    // existem favoritos
    return ListView.builder(
      itemCount: favoriteMeals.length,
      itemBuilder: (ctx, idx) {
        return MealItem(favoriteMeals[idx]);
      },
    );
  }
}
