import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
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
        child: Column(
          children: <Widget>[
            Image.network("${recipes.image}"),
            Expanded(
              flex: 1,
              child: Container(
                height: 60.h,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                child: Padding(
                  padding:  EdgeInsets.all(0.8.h),
                  child: Container(
                    padding:  EdgeInsets.all(.8.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[200],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DefaultText(text: "Fats : ${recipes.fats}",
                            fontSize: 13.sp),
                        DefaultText(
                            text: "Calories : ${recipes.calories}",
                            fontSize: 13.sp
                        ),
                        const  Divider(
                          color: Colors.grey,
                        ),
                        DefaultText(
                          text: "Description: ${recipes.description}",
                          fontSize: 13.sp,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                     const  Divider(
                         color: Colors.grey,
                       ),
                        DefaultText(
                          text: "Headline : ${recipes.headline}",
                          fontSize: 18,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
