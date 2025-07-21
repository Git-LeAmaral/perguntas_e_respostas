import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';

class Questionario extends StatelessWidget {

  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function() responder;

  const Questionario({super.key, 
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.responder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {

    List<String> respostas = temPerguntaSelecionada 
        ? perguntas[perguntaSelecionada].cast()['respostas']
        : [];

        List<Widget> widgets = respostas.map((t) => Resposta(t, responder)).toList();

    return Column(
          children: [
            Questao(
              perguntas[perguntaSelecionada]['texto']
                  .toString(),
            ),
            ...widgets,
          ],
        );
  }
}