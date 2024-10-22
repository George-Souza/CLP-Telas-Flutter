// lib/tela1.dart

import 'package:flutter/material.dart';

class TelaLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ACESSE A PLATAFORMA, SE AVEXE NÃO!'),
        centerTitle: true,
      ),
      body: SingleChildScrollView( // Envolvendo o conteúdo em um SingleChildScrollView
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/oxebanking_logo.png', width: 150, height: 150), // Logo
            SizedBox(height: 16), // Espaço entre a imagem e o campo de e-mail
            TextField(
              decoration: InputDecoration(
                labelText: 'Digite seu e-mail',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Digite sua senha',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Ação de login
              },
              child: Text('Faça Login'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Ação ao clicar no botão de cadastro com Google
              },
              child: Text('Entre com o Google'),
            ),
            SizedBox(height: 16),
            TextButton(
              onPressed: () {
                // Ação ao clicar no botão de cadastro
              },
              child: Text('ou cadastre-se na plataforma'),
            ),
          ],
        ),
      ),
    );
  }
}
