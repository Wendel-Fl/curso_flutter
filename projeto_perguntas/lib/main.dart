import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual seu carro favorito?',
      'respostas': [
        {'texto': 'BMW', 'pontuacao': 10},
        {'texto': 'Porsche', 'pontuacao': 5},
        {'texto': 'Aston Martin', 'pontuacao': 3},
        {'texto': 'Mercedes', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual seu herói favorito?',
      'respostas': [
        {'texto': 'The Flash', 'pontuacao': 10},
        {'texto': 'Batman', 'pontuacao': 5},
        {'texto': 'Arrow', 'pontuacao': 3},
        {'texto': 'Green Lantern', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual seu filme favorito?',
      'respostas': [
        {'texto': 'Training Day', 'pontuacao': 10},
        {'texto': 'Man on Fire', 'pontuacao': 5},
        {'texto': 'Project Almanac', 'pontuacao': 3},
        {'texto': 'Interestelar', 'pontuacao': 1},
      ],
    }
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
    print(_pontuacaoTotal);
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
                onAnswer: _responder)
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
