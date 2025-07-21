import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() reiniciarQuestionario;

  const Resultado(this.pontuacao, this.reiniciarQuestionario, {super.key});

  String get fraseResultado {
    if (pontuacao < 8) {
      return 'Da para melhorar!';
    } else if (pontuacao < 12) {
      return 'Parabéns, muito bom!';
    } else if (pontuacao < 16) {
      return 'Impressionante';
    } else {
      return 'Lendário!!!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(fraseResultado, style: const TextStyle(fontSize: 28)),
        ),
        TextButton(
          onPressed: reiniciarQuestionario,
          style: TextButton.styleFrom(foregroundColor: Colors.blue),
          child: const Text('Reiniciar?', style: TextStyle(fontSize: 20)),
        ),
      ],
    );
  }
}
