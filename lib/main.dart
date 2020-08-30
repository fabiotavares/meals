import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/models/settings.dart';
import 'package:meals/screens/categories_meals_screen.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/meal_datail_screen.dart';
import 'package:meals/screens/settings_screen.dart';
import 'package:meals/screens/tabs_screen.dart';
import 'package:meals/utils/app_routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // configurações deve ser global (último item a ser desctruído)
  var settings = Settings();

  // lista de refeições disponívies, conforme o filtro selecionado
  List<Meal> _availableMeals = DUMMY_MEALS;

  // lista de refeições favoritas
  List<Meal> _favoriteMeals = [];

  // método que será executado sempre que uma configuração for alterada
  void _filterMeals(Settings settings) {
    setState(() {
      // atualizando as configurações globais
      this.settings = settings;

      // filtrar a lista de refeições conforme critérios definidos nas configs
      _availableMeals = DUMMY_MEALS.where((meal) {
        // verificando se a comida deve ser filtrada (não exibida)
        // só não vou exibir se o user pediu glutenfree e a refeição não é!
        final fGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final fLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final fVegan = settings.isVegan && !meal.isVegan;
        final fVegetarian = settings.isVegetarian && !meal.isVegetarian;

        // a refeição não deve ser exibida se um dos filtros acima for true
        final naoExibir = fGluten || fLactose || fVegan || fVegetarian;

        // retorna se a comida deve ser exibida
        return !naoExibir;
      }).toList();
    });
  }

  // método que será chamdo de MEAL_DETAIL quando o status de favorito alternar
  void _toggleFavorite(Meal meal) {
    setState(() {
      // remove da lista se já estiver ou inclui se não estiver;
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  // método que diz se a refeição está na lista de favoritos
  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          // cor da tela
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                ),
              )),
      routes: {
        // rotas de navegação
        AppRoutes.HOME: (ctx) => TabsScreen(_favoriteMeals),
        AppRoutes.CATEGORIES_MEALS: (ctx) =>
            CategoriesMealsScreen(_availableMeals),
        AppRoutes.MEAL_DETAIL: (ctx) => MealDetailScreen(
              _toggleFavorite,
              _isFavorite,
            ),
        AppRoutes.SETTINGS: (ctx) => SettingsScreen(settings, _filterMeals),
      },
      onUnknownRoute: (settings) {
        // não necessário nesta aplicação
        // é chamada quando uma rota desconhecida é passada
        return MaterialPageRoute(builder: (_) {
          return CategoriesScreen(); // poderia ser uma 404 por exemplo
        });
      },
    );
  }
}
