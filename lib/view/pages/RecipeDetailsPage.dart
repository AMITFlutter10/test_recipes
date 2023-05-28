import 'package:flutter/material.dart';
import 'package:test_recipes_app/model/recipes_model.dart';

class RecipeDetailsPage extends StatelessWidget {
  final RecipesModel recipes;

  const RecipeDetailsPage(this.recipes, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${recipes.name}"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network("${recipes.image}"),
            Text(
              "Fats : ${recipes.fats}",
              style:const TextStyle(fontSize: 18),
            ),
            Text(
              "Calories : ${recipes.calories}",
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
