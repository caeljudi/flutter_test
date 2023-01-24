import 'package:flutter/cupertino.dart';

class Label extends StatelessWidget {
  const Label({Key? key, required this.title, required this.des, this.duree})
      : super(key: key);
  final String title;
  final String des;
  final String? duree;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        duree != null
            ? Text(
                "Durée : ${duree!}",
                style: const TextStyle(fontSize: 17),
              )
            : Container(),
        duree != null
            ? const SizedBox(
                height: 20,
              )
            : Container(),
        Text(
          des,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
        ),
      ],
    );
  }
}
