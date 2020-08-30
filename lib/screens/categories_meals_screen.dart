import 'package:flutter/material.dart';
import 'package:meals/components/meal_item.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';

// tela que exibe as refeições da categoria selecionada, através de um ListView

class CategoriesMealsScreen extends StatelessWidget {

  // lista de refeições que serão exibidas
  final List<Meal> meals;

  // construtor
  const CategoriesMealsScreen(this.meals);

  @override
  Widget build(BuildContext context) {
    // obtendo a categoria a partir dos argumentos passados na rota
    final category = ModalRoute.of(context).settings.arguments as Category;

    // obtendo as refeições que pertencem à categoria passada
    final categoryMeals = meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (context, index) {
          return MealItem(categoryMeals[index]);
        },
      ),
    );
  }
}
