import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/view_model.dart';
import 'detail_dialog.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Criptomoedas')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Digite símbolos separados por vírgula',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () => viewModel.fetchCryptos(_controller.text),
                ),
              ),
            ),
          ),
          if (viewModel.isLoading)
            CircularProgressIndicator()
          else if (viewModel.errorMessage != null)
            Text(viewModel.errorMessage!)
          else
            Expanded(
              child: RefreshIndicator(
                onRefresh: () => viewModel.fetchCryptos(_controller.text),
                child: ListView.builder(
                  itemCount: viewModel.criptos.length,
                  itemBuilder: (context, index) {
                    final cripto = viewModel.criptos[index];
                    return ListTile(
                      title: Text('${cripto.simbolo} - ${cripto.nome}'),
                      subtitle: Text(
                          'USD: \$${cripto.precoUsd.toStringAsFixed(2)} | BRL: R\$${cripto.precoBrl.toStringAsFixed(2)}'),
                      onTap: () => showDialog(
                        context: context,
                        builder: (_) => DetailDialog(cripto),
                      ),
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
