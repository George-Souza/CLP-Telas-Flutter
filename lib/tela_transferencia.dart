import 'package:flutter/material.dart';

class TelaTransferencia extends StatefulWidget {
  @override
  _TelaTransferenciaState createState() => _TelaTransferenciaState();
}

class _TelaTransferenciaState extends State<TelaTransferencia> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _destinatarioController = TextEditingController();
  final TextEditingController _valorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferência'),
        centerTitle: true,
        actions: [
          // Logo da lua no canto superior direito
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/lua.png', // Caminho para a imagem
              width: 40, // Ajuste o tamanho da logo
              height: 40, // Ajuste o tamanho da logo
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Instrução ao usuário
              Text(
                'Arretado! Preencha os dados para realizar a transferência.',
                style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold, fontFamily: 'FonteOxe'),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),

              // Campo para o destinatário (CPF ou chave PIX)
              TextFormField(
                controller: _destinatarioController,
                decoration: InputDecoration(
                  labelText: 'Destinatário',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o CPF ou chave PIX do destinatário';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // Campo para o valor da transferência
              TextFormField(
                controller: _valorController,
                decoration: InputDecoration(
                  labelText: 'Valor',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o valor a ser transferido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30),

              // Botão para confirmar a transferência
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Lógica para realizar a transferência
                    _realizarTransferencia(context);
                  }
                },
                child: Text('Realizar Transferência'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _realizarTransferencia(BuildContext context) {
    // Aqui você pode implementar a lógica para realizar a transferência
    final destinatario = _destinatarioController.text;
    final valor = _valorController.text;

    // Exibindo um snackbar como exemplo de confirmação de transferência
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Transferência de R\$ $valor para $destinatario realizada com sucesso!'),
        duration: Duration(seconds: 2),
      ),
    );

    // Após a transação, você pode redirecionar para outra tela ou resetar os campos
    _destinatarioController.clear();
    _valorController.clear();
  }
}
