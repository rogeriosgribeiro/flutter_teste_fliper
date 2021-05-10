import 'package:flutter/material.dart';
import 'package:flutter_teste_fliper/screens/home.dart';
import 'package:flutter_teste_fliper/stores/resumo_store.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Provider<ResumoStore>(
      create: (_) => ResumoStore(),
      child: MaterialApp(
        title: 'Fliper App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Home(),
      ),
    );
  }
}