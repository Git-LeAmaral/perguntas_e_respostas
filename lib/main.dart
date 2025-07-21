import 'package:flutter/material.dart';
import 'package:projeto_perguntas/resultado.dart';
import './questionario.dart';
import './resposta.dart';


void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  final List<Map<String, Object>> _perguntas = const [
      {
        'texto': 'Qual sua cor favorita?',
        'respostas': ['Preto', 'Rosa', 'Azul', 'Branco'],
      },
      {
        'texto': 'Qual seu carro favorito?',
        'respostas': [
          'Hatch',
          'Sedan',
          'Esportivo',
          'Caminhonete',
        ],
      },
      {
        'texto': 'Qual seu Pais favorito?',
        'respostas': [
          'Espanha',
          'Alemanha',
          'Italia',
          'França',
        ],
      },
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

    // for (var textoResp in respostas) {
    //   widgets.add(Resposta(textoResp, _responder));
    // }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Perguntas')),
        body: temPerguntaSelecionada ? Questionario(
          perguntas: _perguntas
          , perguntaSelecionada: _perguntaSelecionada
          , responder: _responder
        ) 
        : const Resultado(),
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
