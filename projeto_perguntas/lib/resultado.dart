import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final String text;

  const Resultado(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: const TextStyle(fontSize: 28),
      ),
    );
  }
}
