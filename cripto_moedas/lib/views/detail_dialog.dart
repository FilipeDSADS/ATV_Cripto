import 'package:flutter/material.dart';
import '../data/models/cripto.dart';
import 'package:intl/intl.dart';

class DetailDialog extends StatelessWidget {
  final Cripto cripto;

  const DetailDialog(this.cripto, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateFormatted =
        DateFormat.yMMMMd('pt_BR').format(DateTime.parse(cripto.dateAdded));

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: Text('${cripto.nome} (${cripto.simbolo})'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Adicionada em: $dateFormatted'),
          const SizedBox(height: 8),
          Text('Preço em USD: ${cripto.precoUsdFormatado}'),
          Text('Preço em BRL: ${cripto.precoBrlFormatado}'),
        ],
      ),
      actions: [
        TextButton(
          child: const Text('Fechar'),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );
  }
}
