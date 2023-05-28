// import 'package:flutter/material.dart';
// import '../../utilities/enums.dart';
// import '../../view_model/Favorites/favorite_cubit.dart';
// import '../shared_widgets/default_text.dart';
//
// class FavoritesList extends StatefulWidget {
//   final String title, fat, imgUrl;
//
//   FavoritesList({required this.title,required this.fat,required this.imgUrl, });
//
//   @override
//   State<FavoritesList> createState() => _FavoritesListState();
// }
//
// class _FavoritesListState extends State<FavoritesList> {
//   late FavoriteCubit favoriteCubit;
//
//   @override
//   void initState() {
//     favoriteCubit = FavoriteCubit.get(context);
//     favoriteCubit.getFavoriteRecipes(key: MySharedKeys.favoriteRecipes);
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return  ListView.builder(
//       itemCount: favoriteCubit.getFavoriteRecipes,
//       itemBuilder: (context, index) {
//         return ListTile(
//           title: DefaultText( text: favoriteCubit.favoriteRecipeIds![] ),
//
//         );
//       },
//     );
//   }
//
// //

import 'package:flutter/material.dart';

import '../../model/services/local_storage/shared_preferences.dart';
import '../../utilities/enums.dart';
import '../shared_widgets/default_text.dart';

class FavoritesList extends StatefulWidget {
  const FavoritesList({Key? key}) : super(key: key);

  @override
  _FavoritesListState createState() => _FavoritesListState();
}

class _FavoritesListState extends State<FavoritesList> {
  late List<String> _favoriteRecipeIds;

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    final prefs = MyCache.preferences;
    final favoriteRecipeIds =
        prefs?.getStringList(MySharedKeys.favoriteRecipes.name) ?? [];
    setState(() {
      _favoriteRecipeIds = favoriteRecipeIds;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const DefaultText(text: 'Favorite Recipes'),
      ),
      body: _favoriteRecipeIds.isNotEmpty
          ? ListView.builder(
              itemCount: _favoriteRecipeIds.length,
              itemBuilder: (context, index) {
                final recipeId = _favoriteRecipeIds[index];
                return ListTile(
                  title: DefaultText(text: 'Recipe $recipeId'),
                );
              },
            )
          : Center(
              child: Text('You have no favorite recipes.'),
            ),
    );
  }
}
