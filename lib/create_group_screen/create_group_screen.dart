import 'package:flutter/material.dart';

class CreateGroupScreen extends StatefulWidget {
  const CreateGroupScreen({super.key});

  @override
  _CreateGroupScreenState createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
  final TextEditingController _groupNameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  String? _selectedFrequency;
  String? _selectedCurrency;
  String? _selectedPaymentMethod;

  final List<Map<String, dynamic>> _frequencies = [
    {'label': 'Cada 15 días', 'value': '15dias'},
    {'label': '1 mes', 'value': '1mes'},
    {'label': '2 meses', 'value': '2meses'},
    {'label': '3 meses', 'value': '3meses'},
  ];

  final List<Map<String, dynamic>> _currencies = [
    {
      'label': 'Bolivianos (BOB)',
      'value': 'BOB',
      'image': Image.asset('assets/bolivia.png', width: 16, height: 16),
    },
    {
      'label': 'Dólares (USD)',
      'value': 'USD',
      'image': Image.asset('assets/dolares.png', width: 16, height: 16),
    },
  ];

  final List<Map<String, dynamic>> _paymentMethods = [
    {
      'label': 'Efectivo',
      'value': 'efectivo',
      'image': Image.asset('assets/efectivo.png', width: 16, height: 16),
    },
    {
      'label': 'Tarjeta',
      'value': 'tarjeta',
      'image': Image.asset('assets/visa.png', width: 16, height: 16),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear Grupo'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _groupNameController,
              decoration: InputDecoration(
                labelText: 'Nombre del Grupo',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Cobrar cada:',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: _frequencies.map((frequency) {
                return ChoiceChip(
                  label: Text(frequency['label']),
                  selected: _selectedFrequency == frequency['value'],
                  onSelected: (bool selected) {
                    setState(() {
                      _selectedFrequency = selected ? frequency['value'] : null;
                    });
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Text(
              'Tipo de Moneda:',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: _currencies.map((currency) {
                return ChoiceChip(
                  label: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      currency['image'], // Mostrando imagen en lugar del ícono
                      SizedBox(width: 4),
                      Text(currency['label']),
                    ],
                  ),
                  selected: _selectedCurrency == currency['value'],
                  onSelected: (bool selected) {
                    setState(() {
                      _selectedCurrency = selected ? currency['value'] : null;
                    });
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Text(
              'Tipo de Cobro:',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: _paymentMethods.map((method) {
                return ChoiceChip(
                  label: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      method['image'], // Mostrando imagen en lugar del ícono
                      SizedBox(width: 4),
                      Text(method['label']),
                    ],
                  ),
                  selected: _selectedPaymentMethod == method['value'],
                  onSelected: (bool selected) {
                    setState(() {
                      _selectedPaymentMethod = selected ? method['value'] : null;
                    });
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Monto para jugar',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Acción del botón "Crear Grupo"
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
                  child: Text('Crear Grupo'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
