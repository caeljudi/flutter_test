import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Stars extends StatelessWidget {
  const Stars({Key? key, required this.count}) : super(key: key);
  final int count;

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= count) {
      icon = const Icon(
        Icons.star_border,
      );
    } else if (index > count - 1 && index < count) {
      icon = const Icon(
        Icons.star_half,
      );
    } else {
      icon = const Icon(
        Icons.star_outline,
        color: Colors.grey,
      );
    }
    return InkResponse(
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        count,
        (index) => buildStar(context, index),
      ),
    );
  }
}
