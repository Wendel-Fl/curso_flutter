import 'package:flutter/material.dart';
import 'resultado.dart';
import './questionario.dart';

main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  final _perguntas = const [
    {
      'texto': 'Qual seu carro favorito?',
      'respostas': [
        {'texto': 'BMW', 'nota': 10},
        {'texto': 'Porsche', 'nota': 5},
        {'texto': 'Aston Martin', 'nota': 3},
        {'texto': 'Mercedes', 'nota': 1},
      ],
    },
    {
      'texto': 'Qual seu herói favorito?',
      'respostas': [
        {'texto': 'The Flash', 'nota': 10},
        {'texto': 'Batman', 'nota': 5},
        {'texto': 'Arrow', 'nota': 3},
        {'texto': 'Green Lantern', 'nota': 1},
      ],
    },
    {
      'texto': 'Qual seu filme favorito?',
      'respostas': [
        {'texto': 'Training Day', 'nota': 10},
        {'texto': 'Man on Fire', 'nota': 5},
        {'texto': 'Project Almanac', 'nota': 3},
        {'texto': 'Interestelar', 'nota': 1},
      ],
    }
  ];

  void _responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    /**
     * Forma imperativa de declarar as respostas
       List<Widget> respostas = []
       for (String textoResp
          in perguntas[_perguntaSelecionada].cast()['respostas']) {
          respostas.add(Resposta(textoResp, _responder));
          }
     */

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder)
            : const Resultado('Parabéns!'),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  State<PerguntaApp> createState() {
    return _PerguntaAppState();
  }
}
