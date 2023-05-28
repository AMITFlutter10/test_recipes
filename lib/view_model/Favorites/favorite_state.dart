part of 'favorite_cubit.dart';

@immutable
abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}
class FavoriteToggledTrueState extends FavoriteState {}
class FavoriteToggledSavedState extends FavoriteState {}
class ChangeCategoriesState extends FavoriteState {}
