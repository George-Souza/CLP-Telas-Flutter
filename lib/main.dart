import 'package:flutter/material.dart';

void main() {
  runApp(AppWidget(
    title: 'OXEBANKING',
  ));
}

class AppWidget extends StatelessWidget {
  final String title;

  const AppWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(), // Removi o primarySwatch
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFECDBCA), // Definindo a cor de fundo
      child: Center(
        child: Image.asset('assets/oxebanking_logo.png'), // Substitua pelo caminho da sua imagem
      ),
    );
  }
}