import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/recipe.dart';

class RecipeService {
  static Future<List<Recipe>> readJson(String file) async {
    final response = await rootBundle.loadString("assets/$file");
    final List data = await json.decode(response);

    return data.map((recipe) => Recipe.fromJson(recipe)).toList();
  }

  static convert(int value) {
    int hours = (value / 60).floor();
    int remainingMinutes = value % 60;
    if (hours == 0) {
      return "$remainingMinutes min";
    } else if (remainingMinutes == 0) {
      return "$hours h";
    } else {
      return "$hours h $remainingMinutes min";
    }
  }
}

extension Recipesort on List<Recipe> {
  sortRecipes() {
    for (int i = 0; i < length - 1; i++) {
      int maxIndex = i;
      for (int j = i + 1; j < length; j++) {
        if (this[j].note == this[maxIndex].note) {
          if (this[j].duree == this[maxIndex].duree) {
            if (this[j].name.compareTo(this[maxIndex].name) < 0) {
              maxIndex = j;
            }
          } else if (this[j].duree > this[maxIndex].duree) {
            maxIndex = j;
          }
        } else if (this[j].note > this[maxIndex].note) {
          maxIndex = j;
        }
      }
      if (maxIndex != i) {
        var temp = this[i];
        this[i] = this[maxIndex];
        this[maxIndex] = temp;
      }
    }
    return this;
  }

  insertRecipes({recipe: Recipe}) {
    add(recipe);
    sortRecipes();
  }

  // for (var i = 0; i < this.length; i++) {
  //   for (var j = 1; j < this.length - i; j++) {
  //     if (this[j - 1].note! < this[j].note!) {
  //       var temp = this[j - 1];
  //       this[j - 1] = this[j];
  //       this[j] = temp;
  //     } else if (this[j - 1].note! != null &&
  //         this[j - 1].note! == this[j].note!) {
  //       if (this[j - 1].duree! < this[j].duree!) {
  //         var temp = this[j - 1];
  //         this[j - 1] = this[j];
  //         this[j] = temp;
  //       } else if (this[j - 1].duree != null &&
  //           this[j - 1].duree! == this[j].duree!) {
  //         if (this[j - 1] != null &&
  //             this[j - 1]
  //                     .name!
  //                     .toLowerCase()
  //                     .compareTo(this[j].name!.toLowerCase()) >
  //                 0) {
  //           var temp = this[j - 1];
  //           this[j - 1] = this[j];
  //           this[j] = temp;
  //         }
  //       }
  //     }
  //   }
  // }
}

  // insert({recipe: Recipe}) {
  //   add(recipe);
  //   sortRecipes();
  // }
