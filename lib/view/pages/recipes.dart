import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utilities/app_constants.dart';
import '../../view_model/product/recipes_cubit.dart';
import '../shared_widgets/card_recipes.dart';
import '../shared_widgets/default_text.dart';

class RecipesPage extends StatefulWidget {
  const RecipesPage({super.key});

  @override
  State<RecipesPage> createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  late RecipesCubit recipesCubit;

  @override
  void initState() {
    recipesCubit = RecipesCubit.get(context);
    recipesCubit.getRecipes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecipesCubit, RecipesState>(listener: (context, state) {
      if (state is LoadingRecipesSuccessState) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        );
      } else if (state is LoadingRecipesErrorState) {
        Navigator.of(context).pop(); // remove the dialog
      }
    },
    builder: (context, state) {
    return Scaffold(
          body: SafeArea(
              child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CarouselSlider(
                          options: CarouselOptions(
                            aspectRatio: 2.0,
                            enlargeCenterPage: true,
                            scrollDirection: Axis.horizontal,
                            autoPlay: true,
                          ),
                          items: imgList,
                        ),
                        const DefaultText(
                          text: 'Recipes',
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: ListView.separated(
                            shrinkWrap: true,
                            itemCount: recipesCubit.recipes.length,
                            separatorBuilder: (context, index) => Divider(
                              color: Colors.grey[400],
                            ),
                            itemBuilder: (context, index) {
                              final recipe = recipesCubit.recipes[index];
                              return Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: recipesCard(recipe));
                            },
                          ),
                        ),
                      ]))));
    });
  }
}
