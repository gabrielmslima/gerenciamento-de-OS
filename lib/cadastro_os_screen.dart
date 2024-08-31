import 'package:flutter/material.dart';

class CadastroOsScreen extends StatelessWidget {
  const CadastroOsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de OS'),
      ),
      body: const Center(
        child: Text('Cadastro de SO'),
      ),
    );
  }
}
