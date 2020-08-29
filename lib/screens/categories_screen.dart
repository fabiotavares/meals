import 'package:flutter/material.dart';
import 'package:meals/components/category_item.dart';
import 'package:meals/data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Vamos Cozinhar?"),
            ),
        body: GridView(
          padding: const EdgeInsets.all(25),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200, //largura máxima de cada elemento na linha
            childAspectRatio: 3/2, //proporção entre altura e largura de cada elem.
            crossAxisSpacing: 20, //espaço no eixo cruzado
            mainAxisSpacing: 20, //espaço no eixo principal
          ),
          children: DUMMY_CATEGORIES.map((cat) {
            return CategoryItem(cat);
          }).toList(),
        ),
    );
  }
}
