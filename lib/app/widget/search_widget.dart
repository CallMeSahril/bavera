import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final String hintText;
  final ValueChanged<String>? onChanged;
  final Widget? widget;
  final TextEditingController? controller;
  const SearchTextField(
      {super.key,
      required this.hintText,
      this.onChanged,
      this.controller,
      this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black12)),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          const Icon(
            Icons.search,
            color: Colors.grey,
            size: 18,
          ),
          SizedBox(width: 8),
          Expanded(
            child: TextFormField(
              controller: controller,
              onChanged: onChanged,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
              ),
            ),
          ),
          widget!,
        ],
      ),
    );
  }
}
