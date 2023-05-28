// import 'package:flutter/material.dart';
// import '../../view_model/Favorites/favorite_cubit.dart';
//
// class FavoritesList extends StatefulWidget {
//   const FavoritesList({Key? key}) : super(key: key);
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
//     favoriteCubit.getFavoriteRecipes();
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return  ListView.builder(
//       itemCount: favoriteCubit.favoriteRecipeIds!.length,
//       itemBuilder: (context, index) {
//         return ListTile(
//           title: Text(),
//           subtitle: Text(),
//           onTap: () {
//           },
//         );
//       },
//     );
//   }
//
//
