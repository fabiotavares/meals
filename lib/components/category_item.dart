import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
import 'package:meals/utils/app_routes.dart';
import 'package:meals/utils/utils.dart';

class CategoryItem extends StatelessWidget {
  // componente construído com base num objeto Category
  final Category category;

  const CategoryItem(this.category);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //poderia ser um gestury... serve para capturar um click
      onTap: () => _selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15), // p/ coincidir com as bordas
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.5),
              category.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }

  _selectCategory(BuildContext context) {
    // navegando por meio de rotas, passando o objeto category como argumento
    Utils.pushNamed(
      context: context,
      route: AppRoutes.CATEGORIES_MEALS,
      argument: category,
    );
  }
}
