import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String text;
  final void Function() onSelection;

  const Resposta(this.text, this.onSelection, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(onPressed: onSelection, child: Text(text)));
  }
}
