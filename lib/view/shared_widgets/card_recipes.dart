import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:test_recipes_app/model/recipes_model.dart';
import 'package:test_recipes_app/view/shared_widgets/default_text.dart';

import '../../view_model/Favorites/favorite_cubit.dart';
class RecipesCard extends StatelessWidget {
  RecipesModel recipes;

  RecipesCard({Key? key, required this.recipes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        return Card(
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                    context, 'recipeDetailsPage', arguments: recipes);
              },
              child: Padding(
                padding:  EdgeInsets.all(.9.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network("${recipes.image}"),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, top: 10),
                      child: DefaultText(
                          text: "${recipes.name}",
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    ListTile(
                      title: DefaultText(
                        text: "Fats : ${recipes.fats}",
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[700],
                      ),
                      subtitle: DefaultText(
                        text: "Calories : ${recipes.calories}",
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[700],
                      ),
                      trailing: IconButton(
                        onPressed: () async {
                          await FavoriteCubit.get(context).toggleFavorite(
                              recipeId: "${recipes.id}");
                        },
                        icon: Icon(
                          FavoriteCubit.get(context).isFavorite(
                              recipeId: "${recipes.id}")
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: FavoriteCubit.get(context).isFavorite(
                              recipeId: "${recipes.id}")
                              ? Colors.red
                              : null,
                        ),

                      ),
                    )
                  ],
                ),
              ),
            ));
      },
    );
  }
}
