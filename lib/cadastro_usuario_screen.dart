import 'package:flutter/material.dart';

class CadastroUsuarioScreen extends StatefulWidget {
  const CadastroUsuarioScreen({super.key});

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<CadastroUsuarioScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ButtonStyle style =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 16));

  String _userID = '';
  String _userName = '';
  String _phoneNumber = '';
  String _email = '';
  String _password = '';

  String _dropdownValue = 'Cliente';

  void dropdownCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _dropdownValue = selectedValue;
      });
    }
  }

  void _clearForm() {
    _idController.clear();
    _userController.clear();
    _phoneController.clear();
    _emailController.clear();
    _passwordController.clear();
    setState(() {
      _dropdownValue = 'Cliente';
    });
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print('ID: $_userID');
      print('NOME: $_userName');
      print('FONE: $_phoneNumber');
      print('EMAIL: $_email');
      print('Email: $_password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de usuarios'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _idController,
                decoration: const InputDecoration(
                    labelText: 'ID do Usuario', border: OutlineInputBorder()),
                onSaved: (value) {
                  _userID = value ?? '';
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _userController,
                decoration: const InputDecoration(
                    labelText: 'Usuario', border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insira o nome do usuario';
                  }
                  return null;
                },
                onSaved: (value) {
                  _userName = value ?? '';
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
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                    labelText: 'Senha', border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insira a senha';
                  }
                  return null;
                },
                onSaved: (value) {
                  _password = value ?? '';
                },
              ),
              const SizedBox(height: 16.0),
              DropdownButtonFormField(
                items: const [
                  DropdownMenuItem(child: Text('Cliente'), value: 'Cliente'),
                  DropdownMenuItem(child: Text('Administrador'), value: 'Administrador'),
                  DropdownMenuItem(child: Text('Usuario'), value: 'Usuario'),
                ],
                value: _dropdownValue,
                onChanged: dropdownCallback,
                isExpanded: true,
                decoration: const InputDecoration(
                  labelText: 'Selecione uma opcao',
                  border: OutlineInputBorder()
                ),
              ),
              const Spacer(), // Pushes the buttons to the bottom
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
