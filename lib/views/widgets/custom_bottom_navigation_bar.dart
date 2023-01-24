import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomIconData {
  String name;
  IconData icons;

  CustomIconData({required this.name, required this.icons});
}

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar(
      {Key? key, required this.icons, required this.onIconTap})
      : super(key: key);
  final List<CustomIconData> icons;
  final void Function(String) onIconTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 83,
        decoration: const BoxDecoration(
          color: Color(0xffF9F9F9F0),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, -0.5),
                color: Color(0xffE8E8E8),
                spreadRadius: 2,
                blurRadius: 2),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 12, left: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...icons.map(
                (CustomIconData icon) => Row(
                  children: [
                    InkWell(
                      onTap: () => onIconTap(icon.name),
                      child: Icon(icon.icons, color: Colors.blue),
                    ),
                    const SizedBox(
                      width: 54,
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
