import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';
import './resultado.dart';

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
    

    List<String> respostas = temPerguntaSelecionada 
        ? _perguntas[_perguntaSelecionada].cast()['respostas']
        : [];
    List<Widget> widgets = respostas.map((t) => Resposta(t, _responder)).toList();

    // for (var textoResp in respostas) {
    //   widgets.add(Resposta(textoResp, _responder));
    // }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Perguntas')),
        body: temPerguntaSelecionada ? Column(
          children: [
            Questao(
              _perguntas[_perguntaSelecionada]['texto']
                  .toString(),
            ),
            ...widgets,
          ],
        ) : Resultado(),
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
