import 'package:flutter/material.dart';
import 'resultado.dart';
import './questionario.dart';

main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  final _perguntas = const [
    {
      'texto': 'Qual seu carro favorito?',
      'respostas': ['BMW', 'Porsche', 'Aston Martin', 'Mercedes'],
    },
    {
      'texto': 'Qual seu herói favorito?',
      'respostas': ['The Flash', 'Batman', 'Arrow', 'Green Lantern'],
    },
    {
      'texto': 'Qual seu filme favorito?',
      'respostas': [
        'Training Day',
        'Man on Fire',
        'Project Almanac',
        'Interestelar'
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
