import 'package:flutter/material.dart';

class TelaSaudacao extends StatelessWidget {
  final String nomeUsuario;
  final double saldo;

  TelaSaudacao({required this.nomeUsuario, required this.saldo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bem-vindo, $nomeUsuario!'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Saudação ao usuário
            Text(
              'Olá, $nomeUsuario!',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),

            // Retângulo para mostrar o saldo
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text(
                    'Seu Saldo',
                    style: TextStyle(fontSize: 20, color: Colors.blueGrey),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'R\$ ${saldo.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),

            // Botões circulares
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircularButton(icon: Icons.add, label: 'Adicionar', onPressed: () {
                  // Ação para adicionar
                }),
                CircularButton(icon: Icons.remove, label: 'Retirar', onPressed: () {
                  // Ação para retirar
                }),
                CircularButton(icon: Icons.history, label: 'Histórico', onPressed: () {
                  // Ação para histórico
                }),
              ],
            ),
            Spacer(),

            // Botão para voltar para a tela inicial
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12),
              ),
              child: Text(
                'Voltar para Home',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget para criar os botões circulares
class CircularButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  CircularButton({required this.icon, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: EdgeInsets.all(20),
          ),
          child: Icon(icon, size: 30),
        ),
        SizedBox(height: 8),
        Text(label),
      ],
    );
  }
}
