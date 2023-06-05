import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptativeTextField extends StatelessWidget {
  final String? label;
  final TextEditingController? titleController;
  final TextInputType? keyboardType;
  final Function(String)? onSubmitted;

  const AdaptativeTextField({
    this.label,
    this.titleController,
    this.keyboardType = TextInputType.text,
    this.onSubmitted,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: CupertinoTextField(
              controller: titleController,
              keyboardType: keyboardType,
              onSubmitted: (_) => onSubmitted,
              placeholder: label,
              padding: const EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 12,
              ),
            ),
          )
        : TextField(
            controller: titleController,
            keyboardType: keyboardType,
            onSubmitted: (_) => onSubmitted,
            decoration: InputDecoration(
              labelText: label,
            ),
          );
  }
}
