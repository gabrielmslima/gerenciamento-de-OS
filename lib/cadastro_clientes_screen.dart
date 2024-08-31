import 'package:flutter/material.dart';

class CadastroClienteScreen extends StatelessWidget {
  const CadastroClienteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de clientes'),
      ),
      body: const Center(
        child: Text('Cadastro de Clientes'),
      ),
    );
  }
}
