import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/datasource/api_service.dart';
import 'data/datasource/exchange_service.dart';
import 'repository/repository.dart';
import 'viewmodel/view_model.dart';
import 'views/home_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() {
  final exchangeService = ExchangeService();
  final apiService = ApiService(exchangeService: exchangeService);
  final repository = Repository(apiService);

  runApp(
    ChangeNotifierProvider(
      create: (_) => ViewModel(repository),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'APP Cripto Moedas',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
      locale: Locale('pt', 'BR'),
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('pt', 'BR'),
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}

