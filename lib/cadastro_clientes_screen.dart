import 'package:flutter/material.dart';

class CadastroClienteScreen extends StatefulWidget {
  const CadastroClienteScreen({super.key});

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<CadastroClienteScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ButtonStyle style = ElevatedButton.styleFrom(
    textStyle: const TextStyle(fontSize: 16),
    fixedSize: const Size(300, 40)
  );

  String _userAdress = '';
  String _userName = '';
  String _phoneNumber = '';
  String _email = '';
  String _password = '';

  void _clearForm() {
    _idController.clear();
    _userController.clear();
    _phoneController.clear();
    _emailController.clear();
    _passwordController.clear();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print('ID: $_userAdress');
      print('Nome: $_userName');
      print('Fone: $_phoneNumber');
      print('Email: $_email');
      print('Senha: $_password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Cliente'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _userController,
                decoration: const InputDecoration(
                    labelText: 'Nome', border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insira o nome do cliente';
                  }
                  return null;
                },
                onSaved: (value) {
                  _userName = value ?? '';
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _idController,
                decoration: const InputDecoration(
                    labelText: 'Endereco', border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insira o endereco do cliente';
                  }
                  return null;
                },
                onSaved: (value) {
                  _userAdress = value ?? '';
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(
                    labelText: 'Telefone', border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insira o telefone';
                  }
                  return null;
                },
                onSaved: (value) {
                  _phoneNumber = value ?? '';
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                    labelText: 'Email', border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insira o email';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value ?? '';
                },
              ),
              const Spacer(),
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: style,
                      onPressed: _submitForm,
                      child: const Text('Submit'),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: style,
                          onPressed: _clearForm,
                          child: const Text('Clear'),
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: ElevatedButton(
                          style: style,
                          onPressed: () {},
                          child: const Text('Consultar'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
