import 'package:flutter/material.dart';
import '../data/models/cripto.dart';
import 'package:intl/intl.dart';

class DetailDialog extends StatelessWidget {
  final Cripto cripto;

  DetailDialog(this.cripto);

  @override
  Widget build(BuildContext context) {
    final dateFormatted =
        DateFormat.yMMMMd().format(DateTime.parse(cripto.dateAdded));
    return AlertDialog(
      title: Text('${cripto.nome} (${cripto.simbolo})'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Adicionada em: $dateFormatted'),
          Text('Preço em USD: \$${cripto.precoUsd.toStringAsFixed(2)}'),
          Text('Preço em BRL: R\$${cripto.precoBrl.toStringAsFixed(2)}'),
        ],
      ),
      actions: [
        TextButton(
          child: Text('Fechar'),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );
  }
}
