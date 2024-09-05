import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CadastroOsScreen extends StatefulWidget {
  const CadastroOsScreen({super.key});

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<CadastroOsScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _osIdController = TextEditingController();
  final TextEditingController _deviceController = TextEditingController();
  final TextEditingController _serviceController = TextEditingController();
  final TextEditingController _professionalController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _defectController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 16),
      fixedSize: const Size(300, 40));

  String _osID = '';
  String _device = '';
  String _service = '';
  String _professional = '';
  String _price = '';
  String _defect = '';

  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _dateController.text = DateFormat('dd/MM/yyyy').format(_selectedDate);
  }

  void _clearForm() {
    _osIdController.clear();
    _deviceController.clear();
    _serviceController.clear();
    _professionalController.clear();
    _priceController.clear();
    _defectController.clear();
    setState(() {
      _selectedDate = DateTime.now();
      _dateController.text = DateFormat('dd/MM/yyyy').format(_selectedDate);
    });
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print('ID: $_osID');
      print('Dispositivo: $_device');
      print('Serviço: $_service');
      print('Técnico: $_professional');
      print('Valor: $_price');
      print('Defeito: $_defect');
      print('Data: ${DateFormat('dd/MM/yyyy').format(_selectedDate)}');
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = DateFormat('dd/MM/yyyy').format(_selectedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de OS'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _osIdController,
                decoration: const InputDecoration(
                    labelText: 'ID do OS', border: OutlineInputBorder()),
                onSaved: (value) {
                  _osID = value ?? '';
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _deviceController,
                decoration: const InputDecoration(
                    labelText: 'Dispositivo', border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insira o nome do dispositivo';
                  }
                  return null;
                },
                onSaved: (value) {
                  _device = value ?? '';
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _serviceController,
                decoration: const InputDecoration(
                    labelText: 'Serviço', border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insira o nome do serviço';
                  }
                  return null;
                },
                onSaved: (value) {
                  _service = value ?? '';
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _professionalController,
                decoration: const InputDecoration(
                    labelText: 'Técnico', border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insira o nome do técnico';
                  }
                  return null;
                },
                onSaved: (value) {
                  _professional = value ?? '';
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(
                    labelText: 'Valor', border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insira o valor';
                  }
                  return null;
                },
                onSaved: (value) {
                  _price = value ?? '';
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _defectController,
                maxLines: null,
                minLines: 3,
                decoration: const InputDecoration(
                    labelText: 'Defeito', border: OutlineInputBorder()),
                onSaved: (value) {
                  _defect = value ?? '';
                },
              ),
              const SizedBox(height: 16.0),
              GestureDetector(
                onTap: () => _selectDate(context),
                child: AbsorbPointer(
                  child: TextFormField(
                    controller: _dateController,
                    decoration: InputDecoration(
                      labelText: 'Data',
                      border: const OutlineInputBorder(),
                      prefixIcon: Icon(Icons.calendar_today),
                    ),
                    onSaved: (value) {
                      _dateController.text = value ?? '';
                    },
                  ),
                ),
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
