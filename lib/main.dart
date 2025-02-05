import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String numero = '0';
  String operacao = '';
  double primeiroNumero = 0.0;

  void calcular(String tecla) {
    switch (tecla) {
      case '0':
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
      case '.':
        setState(() {
          numero += tecla;
          numero = numero.replaceAll(',', '.');

          if (numero.contains('.')) {
            //double numeroDouble = double.parse(numero);
            //numero = numeroDouble.toString();
          } else {
            int numeroInt = int.parse(numero);
            numero = numeroInt.toString();
          }
          numero = numero.replaceAll('.', ',');
        });

        break;

      case '+':
      case '-':
      case 'x':
      case '÷':
      case '%':
        operacao = tecla;
        numero = numero.replaceAll(',', '.');
        primeiroNumero = double.parse(numero);
        numero = numero.replaceAll('.', ',');
        numero = '0';
        break;

      case '=':
        double resultado = 0.0;

        if (operacao == '÷') {
          if (double.parse(numero) * 1 == 0) {
            print('Error divisão por zero');
            return;
          }
        }

        if (operacao == '+') {
          resultado = primeiroNumero + double.parse(numero);
        }
        if (operacao == '-') {
          resultado = primeiroNumero - double.parse(numero);
        }
        if (operacao == 'x') {
          resultado = primeiroNumero * double.parse(numero);
        }
        if (operacao == '÷') {
          resultado = primeiroNumero / double.parse(numero);
        }
        if (operacao == '%') {
          if (numero == '0') {
            resultado = 0.0;
          } else {
            resultado = (primeiroNumero * double.parse(numero)) / 100;
          }
        }

        String resultadoString = resultado.toString();

        List<String> resultadoPartes = resultadoString.split('.');

        if (int.parse(resultadoPartes[1]) * 1 == 0) {
          setState(() {
            numero = int.parse(resultadoPartes[0]).toString();
          });
        } else {
          setState(() {
            numero = resultado.toStringAsFixed(2);
          });
        }

        break;

      case 'C':
        setState(() {
          numero = '';
        });
        break;

      case 'D':
        setState(() {
          if (numero.isNotEmpty) {
            numero = numero.substring(0, numero.length - 1);
          }
        });

        break;
      default:
        numero += tecla;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 22, 22, 22),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 50, 25, 0),
                    child: Text(
                      numero,
                      style: TextStyle(fontSize: 60, color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () => calcular('C'),
                  child: Text(
                    'C',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
                IconButton(
                  onPressed: () => calcular('D'),
                  icon: Icon(
                    Icons.backspace,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
                TextButton(
                    onPressed: () => calcular('%'),
                    child: Text('%',
                        style: TextStyle(fontSize: 25, color: Colors.white))),
                TextButton(
                  onPressed: () => calcular('÷'),
                  child: Text('÷',
                      style: TextStyle(fontSize: 25, color: Colors.white)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: () => calcular('7'),
                    child: Text('7',
                        style: TextStyle(fontSize: 25, color: Colors.white))),
                TextButton(
                    onPressed: () => calcular('8'),
                    child: Text('8',
                        style: TextStyle(fontSize: 25, color: Colors.white))),
                TextButton(
                    onPressed: () => calcular('9'),
                    child: Text('9',
                        style: TextStyle(fontSize: 25, color: Colors.white))),
                TextButton(
                    onPressed: () => calcular('x'),
                    child: Text('x',
                        style: TextStyle(fontSize: 25, color: Colors.white))),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: () => calcular('4'),
                    child: Text('4',
                        style: TextStyle(fontSize: 25, color: Colors.white))),
                TextButton(
                    onPressed: () => calcular('5'),
                    child: Text('5',
                        style: TextStyle(fontSize: 25, color: Colors.white))),
                TextButton(
                    onPressed: () => calcular('6'),
                    child: Text('6',
                        style: TextStyle(fontSize: 25, color: Colors.white))),
                TextButton(
                    onPressed: () => calcular('-'),
                    child: Text('-',
                        style: TextStyle(fontSize: 25, color: Colors.white))),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: () => calcular('1'),
                    child: Text('1',
                        style: TextStyle(fontSize: 25, color: Colors.white))),
                TextButton(
                    onPressed: () => calcular('2'),
                    child: Text('2',
                        style: TextStyle(fontSize: 25, color: Colors.white))),
                TextButton(
                    onPressed: () => calcular('3'),
                    child: Text('3',
                        style: TextStyle(fontSize: 25, color: Colors.white))),
                TextButton(
                    onPressed: () => calcular('+'),
                    child: Text('+',
                        style: TextStyle(fontSize: 25, color: Colors.white))),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(''),
                TextButton(
                    onPressed: () => calcular('0'),
                    child: Text('0',
                        style: TextStyle(fontSize: 25, color: Colors.white))),
                TextButton(
                    onPressed: () => calcular('.'),
                    child: Text('.',
                        style: TextStyle(fontSize: 25, color: Colors.white))),
                TextButton(
                    onPressed: () => calcular('='),
                    child: Text('=',
                        style: TextStyle(fontSize: 25, color: Colors.white))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
