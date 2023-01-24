import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomModal extends StatelessWidget {
  const CustomModal({Key? key, required this.onDestroy}) : super(key: key);
  final void Function() onDestroy;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text("Title"),
      content: const Text("Message"),
      actions: [
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () {
            Navigator.pop(context);
            onDestroy();
          },
          child: const Text(
            'Destroy',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
