part of 'recipes_cubit.dart';

@immutable
abstract class RecipesState {}

class RecipesInitial extends RecipesState {}
class LoadingRecipesSuccessState extends RecipesState {}
class GetRecipesSuccessState extends RecipesState {}
class LoadingRecipesErrorState extends RecipesState {
}
