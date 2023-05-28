import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_recipes_app/utilities/enums.dart';
import '../../model/services/local_storage/shared_preferences.dart';
part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

  static FavoriteCubit get(context) => BlocProvider.of(context);

   Future<void> toggleFavorite({required String recipeId}) async {
    final Set<String> favoriteRecipeIds = MyCache.preferences
            ?.getStringList(MySharedKeys.favoriteRecipes.name)
            ?.toSet() ??
        {};
    if (favoriteRecipeIds.contains(recipeId.toString())) {
      favoriteRecipeIds.remove(recipeId.toString());
    } else {
      favoriteRecipeIds.add(recipeId.toString());
    }

    await MyCache.preferences?.setStringList(
        MySharedKeys.favoriteRecipes.name, favoriteRecipeIds.toList());
    emit(FavoriteToggledTrueState());
  }

   bool isFavorite({required String recipeId}) {
    final Set<String> favoriteRecipeIds = MyCache.preferences
            ?.getStringList(MySharedKeys.favoriteRecipes.name)
            ?.toSet() ??
        {};
    emit(FavoriteToggledSavedState());

    return favoriteRecipeIds.contains(recipeId.toString());
  }

  // // late final List<String>? favoriteRecipeIds ;
  // Future<List<String>?> getFavoriteRecipes({required MySharedKeys key}) async {
  //   return   MyCache.preferences?.
  //    getStringList(MySharedKeys.favoriteRecipes.name);
 int selectedIndex= 0;
 void changeCategories(int index){
   selectedIndex = index;

   emit(ChangeCategoriesState());
 }


}

