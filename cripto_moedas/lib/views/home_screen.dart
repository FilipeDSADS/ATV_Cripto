import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/view_model.dart';
import '../data/models/cripto.dart';
import 'detail_dialog.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Criptomoedas'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Digite símbolos separados por vírgula',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _controller.clear();
                    viewModel.fetchCryptos('');
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onSubmitted: (value) => viewModel.fetchCryptos(value),
            ),
            const SizedBox(height: 12),
            if (viewModel.isLoading)
              const Expanded(
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.deepPurple,
                  ),
                ),
              )
            else if (viewModel.errorMessage != null)
              Expanded(
                child: Center(
                  child: Text(
                    viewModel.errorMessage!,
                    style: const TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            else if (viewModel.criptos.isEmpty)
              const Expanded(
                child: Center(
                  child: Text(
                    'Nenhuma criptomoeda encontrada.',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              )
            else
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () => viewModel.fetchCryptos(_controller.text),
                  child: ListView.separated(
                    separatorBuilder: (_, __) => const Divider(),
                    itemCount: viewModel.criptos.length,
                    itemBuilder: (context, index) {
                      final cripto = viewModel.criptos[index];
                      return ListTile(
                        leading: const Icon(
                          Icons.monetization_on,
                          color: Colors.deepPurple,
                        ),
                        title: Text(
                          '${cripto.nome} (${cripto.simbolo})',
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Text(
                          'USD: ${cripto.precoUsdFormatado}  |  BRL: ${cripto.precoBrlFormatado}',
                          style: const TextStyle(fontSize: 13),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
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
      ),
    );
  }
}
