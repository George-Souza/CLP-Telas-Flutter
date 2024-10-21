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
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tela Home',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Olá, João'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Saldo em conta',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'R\$ 299,78',
              style: TextStyle(fontSize: 24, color: Colors.green, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Ação ao clicar em "Ver extrato"
              },
              child: Text('Ver extrato'),
            ),
            SizedBox(height: 16),
            Text(
              'Com a Oxebanking tenha mais segurança, independência e um banco completo no Nordeste e em todo Brasil. Obrigado por fazer parte dessa experiência.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildFeatureButton(Icons.payment, 'Pagar'),
                _buildFeatureButton(Icons.swap_horiz, 'Transferir'),
                _buildFeatureButton(Icons.account_balance_wallet, 'Depositar'),
                _buildFeatureButton(Icons.more_horiz, 'Mais'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureButton(IconData icon, String label) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon),
          onPressed: () {
            // Ação para o botão específico
          },
        ),
        Text(label),
      ],
    );
  }
}