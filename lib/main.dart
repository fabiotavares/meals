import 'package:flutter/material.dart';
import 'package:meals/screens/categories_meals_screen.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/meal_datail_screen.dart';
import 'package:meals/screens/tabs_screen.dart';
import 'package:meals/utils/app_routes.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1), // cor da tela
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          headline6: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
          ),
        )
      ),
      routes: { // rotas de navegação
        AppRoutes.HOME: (ctx) => TabsScreen(),
        AppRoutes.CATEGORIES_MEALS: (ctx) => CategoriesMealsScreen(),
        AppRoutes.MEAL_DETAIL: (ctx) => MealDetailScreen(),
      },
      onUnknownRoute: (settings) { // não necessário nesta aplicação
        // é chamada quando uma rota desconhecida é passada
        return MaterialPageRoute(
          builder: (_) {
            return CategoriesScreen(); // poderia ser uma 404 por exemplo
          }
        );
      },
    );
  }
}
