import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:test_recipes_app/view_model/Favorites/favorite_cubit.dart';
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
  int selectedIndex = 0;


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
        Navigator.of(context).pop();
      }
    },
    builder: (context, state) {
    return Scaffold(
          body: SafeArea(
              child: Padding(
                  padding:  EdgeInsets.all(.93.h),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 8.h,
                          width: double.infinity,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: categories.length,
                            itemBuilder: (context, index) => buildCategoriesItem(index),
                          ),
                        ),
                        SizedBox(height: 2.h),
                        CarouselSlider(
                          options: CarouselOptions(
                            aspectRatio: 2.0,
                            enlargeCenterPage: true,
                            scrollDirection: Axis.horizontal,
                            autoPlay: true,
                          ),
                          items: imgList,
                        ),
                         DefaultText(
                          text: 'Recipes',
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                        ),
                         SizedBox(
                          height: 1.h
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
                                  child: RecipesCard(recipes: recipe,));
                            },
                          ),
                        ),
                      ]))));
    }

    );

  }


  Widget buildCategoriesItem(int index) {
    return GestureDetector(
      onTap: () {

        FavoriteCubit.get(context).changeCategories(index);
        Navigator.pushNamed(context, categories[index]);
      },
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(left: 12),
        padding:const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        decoration: BoxDecoration(
            color:
            selectedIndex == index ? Color(0xFFEFF3EE) : Colors.transparent,
            borderRadius: BorderRadius.circular(
                1620
            )),
        child: Text(
          categories[index],
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: selectedIndex == index ? Colors.teal : Color(0xFFC2C2B5),
          ),
        ),
      ),
    );
  }

}
