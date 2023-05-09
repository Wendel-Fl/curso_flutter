// import 'dart:html';
import 'dart:io';

import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final perguntas = [
      'Qual seu carro favorito?',
      'Qual seu herói favorito?',
      'Qual seu filme favorito?'
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: Column(
          children: <Widget>[
            Questao(perguntas[_perguntaSelecionada]),
            Resposta('Resposta 1', _responder),
            Resposta('Resposta 2', _responder),
            Resposta('Resposta 3', _responder),
          ],
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
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
