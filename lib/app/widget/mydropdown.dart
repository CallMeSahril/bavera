import 'package:flutter/material.dart';

class MyDropdown extends StatelessWidget {
  const MyDropdown({
    Key? key,
    required this.value,
    this.onChanged,
    required this.items,
    this.textStyle,
  }) : super(key: key);

  final String value;
  final Function(String?)? onChanged;
  final List<String> items;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      // borderRadius: mbRadius,
      value: value,
      items: items
          .map((e) => DropdownMenuItem(
                value: e,
                child: Text(
                  e,
                  style: textStyle,
                ),
              ))
          .toList(),
      underline: const SizedBox(),
      isDense: true,
      isExpanded: true,
      onChanged: onChanged,
    );
  }
}
