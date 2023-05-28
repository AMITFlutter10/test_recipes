class RecipesModel {

  final String? id;
  final String? name;
  final String? image;
  final String? fats;
  final String? calories;
  final String? headline;
  final String? description;

  RecipesModel({this.id,this.fats, this.calories, this.name, this.image, this.headline ,this.description});

  factory RecipesModel.fromJson(dynamic json) {
    return RecipesModel(
        id: json['id'] as String,
        name: json['name'] as String,
        image: json['image'] as String,
        fats: json['fats'] as String,
        calories: json['calories'] as String,
        headline: json['headline'] as String,
        description: json['description'] as String);
  }

  static List<RecipesModel> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return RecipesModel.fromJson(data);
    }).toList();
  }

}
