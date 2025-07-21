import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;

  const Resultado(this.pontuacao, {super.key});

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
    return Center(
      child: Text(fraseResultado, style: const TextStyle(fontSize: 28)),
    );
  }
}
