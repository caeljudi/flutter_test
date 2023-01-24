class Recipe {
  late String name;
  late String image;
  late String ingredients;
  late int duree;
  late String preparation;
  late int note;

  Recipe(
      {required this.name,
      required this.image,
      required this.ingredients,
      required this.duree,
      required this.preparation,
      required this.note});

  Recipe.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? "";
    image = json['image'] ?? "";
    ingredients = json['ingredients'] ?? "";
    duree = json['durée'] ?? 0;
    preparation = json['préparation'] ?? "";
    note = json['note'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['image'] = image;
    data['ingredients'] = ingredients;
    data['durée'] = duree;
    data['préparation'] = preparation;
    data['note'] = note;
    return data;
  }
}
