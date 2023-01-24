import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/services/recipe_service.dart';
import 'package:flutter_app/views/widgets/stars.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard(
      {Key? key,
      required this.stars,
      required this.name,
      required this.duree,
      required this.onTap})
      : super(key: key);
  final int stars;
  final String name;
  final int duree;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xff3c3c435c),
          ),
        ),
        height: 46,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 80,
                    child: Stars(
                      count: stars,
                    ),
                  ),
                  Text(
                    name,
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              Text(
                RecipeService.convert(duree),
                style: const TextStyle(
                    fontSize: 17, fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
