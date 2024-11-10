// lib/tela1.dart

import 'package:flutter/material.dart';
import 'tela_cadastro.dart';
import 'tela_saudacao.dart';

class TelaLogin extends StatefulWidget {
  @override
  _Tela1State createState() => _Tela1State();
}

class _Tela1State extends State<TelaLogin> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Simulação de verificação de login
  void _login() {
    String email = _emailController.text;
    String password = _passwordController.text;

    // Simulando credenciais válidas
    if (email == 'usuario@exemplo.com' && password == 'senha123') {
      // Redirecionar para a Tela de Sucesso ou a Tela Principal
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => TelaSaudacao(nomeUsuario: 'User', saldo: 2000.0),
        ),
      );
    } else {
      // Exibir um erro se as credenciais forem inválidas
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Erro de Login'),
            content: Text('E-mail ou senha incorretos.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ACESSE A PLATAFORMA, SE AVEXE NÃO!',
          style: TextStyle(
            fontFamily: 'FonteOxe', // Nome da fonte definida no pubspec.yaml
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/cacto.png', width: 150, height: 150),
            SizedBox(height: 16),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Digite seu e-mail',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Digite sua senha',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _login, // Chama o método de login
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaCadastro()),
                );
              },
              child: Text('ou cadastre-se na plataforma'),
            ),
          ],
        ),
      ),
    );
  }
}

// Exemplo de Tela de Sucesso
class TelaDeSucesso extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Bem-sucedido!'),
      ),
      body: Center(
        child: Text(
          'Bem-vindo à plataforma!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
