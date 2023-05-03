// import 'dart:html';
import 'dart:io';

// import 'package:projeto_perguntas/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

main() {
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    if (kReleaseMode) exit(1);
  };
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final perguntas = [
    'Qual seu carro favorito?',
    'Qual seu herói favorito?',
    'Qual seu filme favorito?'
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz'),
        ),
        body: Column(
          // mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(perguntas[1]),
            const ElevatedButton(onPressed: null, child: Text('Resposta 1')),
            const ElevatedButton(onPressed: null, child: Text('Resposta 2')),
            const ElevatedButton(onPressed: null, child: Text('Resposta 3')),
          ],
        ),
      ),
    );
  }
}

/*
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  static final perguntas = [
    'Qual seu carro favorito?',
    'Qual seu herói favorito?',
    'Qual seu filme favorito?'
  ];

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(perguntas[1]),
        ElevatedButton(
            style: style, onPressed: null, child: const Text('Resposta 1')),
      ],
    ));
  }
}
*/
