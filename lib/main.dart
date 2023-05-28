import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:test_recipes_app/utilities/router.dart';
import 'package:test_recipes_app/view_model/Favorites/favorite_cubit.dart';
import 'package:test_recipes_app/view_model/account/login_cubit.dart';
import 'package:test_recipes_app/view_model/product/recipes_cubit.dart';
import 'model/services/local_storage/shared_preferences.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await MyCache.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => RecipesCubit()),
        BlocProvider(create: (context) => FavoriteCubit()),
      ],
      child:Sizer(builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
            useMaterial3: true,
          ),
          // home:const RecipesPage(),
          onGenerateRoute: onGenerate,
        );}
      ),
    );
  }
}
