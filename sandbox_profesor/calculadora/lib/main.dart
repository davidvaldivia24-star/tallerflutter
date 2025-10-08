import 'package:flutter/material.dart';

void main() {
  runApp(CalculadoraApp());
}

class CalculadoraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora Flutter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CalculadoraHome(),
    );
  }
}

class CalculadoraHome extends StatefulWidget {
  @override
  _CalculadoraHomeState createState() => _CalculadoraHomeState();
}

class _CalculadoraHomeState extends State<CalculadoraHome> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  double _resultado = 0;

  void _calcular(String operacion) {
    double num1 = double.tryParse(_controller1.text) ?? 0;
    double num2 = double.tryParse(_controller2.text) ?? 0;

    setState(() {
      switch (operacion) {
        case '+':
          _resultado = num1 + num2;
          break;
        case '-':
          _resultado = num1 - num2;
          break;
        case '*':
          _resultado = num1 * num2;
          break;
        case '/':
          _resultado = num2 != 0 ? num1 / num2 : double.nan;
          break;
        default:
          _resultado = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora Simple'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _controller1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Número 1'),
            ),
            TextField(
              controller: _controller2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Número 2'),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              children: [
                ElevatedButton(
                  onPressed: () => _calcular('+'),
                  child: Text('+'),
                ),
                ElevatedButton(
                  onPressed: () => _calcular('-'),
                  child: Text('-'),
                ),
                ElevatedButton(
                  onPressed: () => _calcular('*'),
                  child: Text('*'),
                ),
                ElevatedButton(
                  onPressed: () => _calcular('/'),
                  child: Text('/'),
                ),
              ],
            ),
            SizedBox(height: 30),
            Text(
              'Resultado: $_resultado',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
