import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/datasource/api_service.dart';
import 'repository/repository.dart';
import 'viewmodel/view_model.dart';
import 'views/home_screen.dart';

void main() {
  final apiService = ApiService();
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
      title: 'Crypto MVVM App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}
