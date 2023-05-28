import 'package:flutter/material.dart';
import 'package:test_recipes_app/model/recipes_model.dart';

import '../shared_widgets/default_text.dart';

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
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: <Widget>[
            Image.network("${recipes.image}"),
            Expanded(
              flex: 1,
              child: Container(
                height: MediaQuery.of(context).size.height *.5,
                width: double.infinity,
                decoration:const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )
                ),
                child: Column(
                  children: [
                    DefaultText(
                        text: "Fats : ${recipes.fats}",
                        fontSize: 18),
                  ],
                ),
              ),
            ),
            DefaultText(
                text: "Calories : ${recipes.calories}",
                fontSize: 18
            ),
          ],
        ),
      ),
    );
  }
}
