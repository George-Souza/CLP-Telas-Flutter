import 'package:flutter/material.dart';
import 'package:oxebank2/tela_login.dart';
import 'tela_login.dart';
import 'tela_pix.dart';
import 'tela_transferencia.dart';

void main() {
  String nomeUsuario = 'Leonardo';
  double saldo = 100.50;

  runApp(TelaSaudacao(nomeUsuario: nomeUsuario, saldo: saldo));
}

class TelaSaudacao extends StatefulWidget {
  final String nomeUsuario;
  final double saldo;

  TelaSaudacao({required this.nomeUsuario, required this.saldo});

  @override
  _TelaSaudacaoState createState() => _TelaSaudacaoState();
}

class _TelaSaudacaoState extends State<TelaSaudacao> {
  bool _mostrarSaldo = false; // Controla se o saldo é visível

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bem-vindo, ${widget.nomeUsuario}!',
          style: TextStyle(fontFamily: 'FonteOxe'),
        ),
        centerTitle: true,
        actions: [
          // Logo no canto superior direito
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.asset(
              'assets/lua.png',
              height: 40,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Saudação ao usuário
            Text(
              'Olá, ${widget.nomeUsuario}!',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),

            // Retângulo para mostrar o saldo
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFF332B2B),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text(
                    'Seu Saldo',
                    style: TextStyle(fontSize: 20, color: Color(0xFFA17C6B)),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _mostrarSaldo = !_mostrarSaldo; // Alterna a visibilidade
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _mostrarSaldo
                              ? 'R\$ ${widget.saldo.toStringAsFixed(2)}'
                              : '****',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFA17C6B),
                          ),
                        ),
                        Icon(
                          _mostrarSaldo
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Color(0xFFA17C6B),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),

            // Botões circulares para PIX, Transferência e Histórico
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircularButton(
                  icon: Icons.credit_card,
                  label: 'PIX',
                  onPressed: () {
                    // Redirecionar para a tela de PIX
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TelaPix()),
                    );
                  },
                ),
                CircularButton(
                  icon: Icons.send,
                  label: 'Transferência',
                  onPressed: () {
                    // Redirecionar para a tela de Transferência
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TelaTransferencia()),
                    );
                  },
                ),
                CircularButton(
                  icon: Icons.history,
                  label: 'Histórico',
                  onPressed: () {
                    // Exibir histórico em um popup
                    _mostrarHistorico(context);
                  },
                ),
              ],
            ),
            Spacer(),

            // Botão para voltar para a tela inicial
            ElevatedButton(
              onPressed: () {
                // Navegar para a tela de login e remover as telas anteriores da pilha de navegação
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => TelaLogin()),
                      (route) => false,
                );
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

  // Função para exibir o histórico em um popup (Dialog)
  void _mostrarHistorico(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Histórico de Transferências'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Histórico simulado de transferências
              Text('1. Transferência para João: R\$ 50,00'),
              Text('2. Transferência para Maria: R\$ 30,00'),
              Text('3. Transferência para Pedro: R\$ 20,00'),
              SizedBox(height: 10),
              Text('Total Transferido: R\$ 100,00'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fechar o popup
              },
              child: Text('Fechar'),
            ),
          ],
        );
      },
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
            backgroundColor: Color(0xFFA17C6B),
          ),
          child: Icon(icon, size: 30),
        ),
        SizedBox(height: 8),
        Text(label),
      ],
    );
  }
}
