import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/recipe.dart';
import 'package:flutter_app/services/recipe_service.dart';
import 'package:flutter_app/views/pages/recipe_details_page.dart';
import 'package:flutter_app/views/widgets/recipe_card.dart';

import '../widgets/custom_bottom_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Recipe> recipes = [];
  List<String> images = ["coco.jpg", "gaspacho.jpg", "strawberries.jpg"];
  List<int> stars = [1, 2, 3];

  fetch() async {
    List<Recipe> test = await RecipeService.readJson("recipes.json");

    setState(() {
      recipes = test;
    });
  }

  initRecipe() async {
    await fetch();
    setState(() {
      recipes = recipes.sortRecipes();
    });
  }

  @override
  void initState() {
    initRecipe();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        icons: [
          CustomIconData(name: "add", icons: Icons.add),
        ],
        onIconTap: (String icon) => {
          setState(() => {}),
          if (icon == "add")
            {
              recipes.insertRecipes(
                recipe: Recipe(
                  name: "Nouvelle recette ${recipes.length + 1}",
                  image: images[Random().nextInt(3)],
                  ingredients: "Lorem Ipsum",
                  duree: ((Random().nextInt(18) + 3) * 10),
                  preparation: "Lorem Ipsum",
                  note: stars[Random().nextInt(3)],
                ),
              )
            }
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Recettes",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 34),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 43),
        child: ListView.builder(
          itemCount: recipes.length,
          itemBuilder: (context, index) => RecipeCard(
            stars: recipes[index].note,
            name: recipes[index].name,
            duree: recipes[index].duree,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RecipeDetailsPage(
                  recipe: recipes[index],
                  onTap: (Recipe recipe) => {
                    setState(
                      () => {},
                    ),
                    recipes.remove(recipe)
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
