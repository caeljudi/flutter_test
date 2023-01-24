import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/services/recipe_service.dart';
import 'package:flutter_app/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter_app/views/widgets/custom_modal.dart';
import 'package:flutter_app/views/widgets/label.dart';

import '../../models/recipe.dart';

class RecipeDetailsPage extends StatelessWidget {
  const RecipeDetailsPage({Key? key, required this.recipe, required this.onTap})
      : super(key: key);
  final Recipe recipe;
  final void Function(Recipe) onTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        icons: [
          CustomIconData(name: "share", icons: Icons.ios_share),
          CustomIconData(name: "note", icons: Icons.note_alt),
          CustomIconData(name: "delete", icons: Icons.delete),
        ],
        onIconTap: (String iconName) => {
          if (iconName == "delete")
            {
              showCupertinoDialog(
                context: context,
                builder: (context) => CustomModal(
                  onDestroy: () {
                    onTap(recipe);
                    Navigator.pop(context);
                  },
                ),
              ),
            }
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xff007AFF)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        titleSpacing: -20,
        title: const Text(
          "Recettes",
          style: TextStyle(
            color: Color(0xff007AFF),
            fontWeight: FontWeight.w600,
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                recipe.name,
                style:
                    const TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 19),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset("assets/${recipe.image}"),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Label(title: "Ingrédients", des: recipe.ingredients),
              const SizedBox(
                height: 12,
              ),
              Label(
                title: "Préparation",
                des: recipe.preparation,
                duree: RecipeService.convert(recipe.duree),
              ),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
