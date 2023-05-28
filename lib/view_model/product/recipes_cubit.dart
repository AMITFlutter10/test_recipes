import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../model/recipes_model.dart';
import '../../utilities/services/remote/dio_helper.dart';
import '../../utilities/services/remote/end_points.dart';

part 'recipes_state.dart';

class RecipesCubit extends Cubit<RecipesState> {
  RecipesCubit() : super(RecipesInitial());
  static RecipesCubit get(context) => BlocProvider.of(context);
  RecipesModel recipesModel =RecipesModel();
  List<RecipesModel> recipes=[];

  Future<void> getRecipes() async {
    emit(LoadingRecipesSuccessState());
    final response = await DioHelper.getData(url: baseUrl+apiKey);
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      // print(response.data.toString());
      recipes = data.map((recipeJson) => RecipesModel.fromJson(recipeJson)).toList();
      // print("${recipes.toString()}MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM");
      emit(GetRecipesSuccessState());
    } else {
    emit(LoadingRecipesErrorState());
      throw Exception('Failed to load data');
    }
  }
}
