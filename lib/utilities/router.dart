
import 'package:flutter/material.dart';
import 'package:test_recipes_app/utilities/routes.dart';
import 'package:test_recipes_app/view/pages/login_page.dart';

import '../model/recipes_model.dart';
import '../view/pages/RecipeDetailsPage.dart';
import '../view/pages/recipes.dart';

Route<dynamic>? onGenerate(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AppRoutes.loginPageRoute:
      return MaterialPageRoute(
          builder: (_) => const LoginPage(),
          settings: routeSettings);

    case AppRoutes.recipesPageRoute:
      return MaterialPageRoute(
          builder: (_) => const RecipesPage(),
          settings: routeSettings);

    case AppRoutes.recipeDetailsPageRoute:
      RecipesModel recipes = routeSettings.arguments as RecipesModel;
    return MaterialPageRoute(
        builder: (_) => RecipeDetailsPage(recipes),
        settings: routeSettings,
      );
    default:
      return  null ;

  }
}
