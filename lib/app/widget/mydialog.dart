import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyDialog extends StatelessWidget {
  final Function() onYes;
  final Function() onNo;
  String title;
  Widget content;

  MyDialog(
      {Key? key,
      required this.onYes,
      required this.onNo,
      required this.title,
      required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('$title'),
      content: content,
      actions: [
        TextButton(
          onPressed: onYes,
          child: Text('Ya'),
        ),
        TextButton(
          onPressed: onNo,
          child: Text('Tidak'),
        ),
      ],
    );
  }
}
