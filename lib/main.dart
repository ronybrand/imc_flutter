import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "1º App Flutter",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController nome = TextEditingController();
  TextEditingController altura = TextEditingController();
  TextEditingController peso = TextEditingController();
  String msg = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("App IMC"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network("https://i.pinimg.com/736x/fd/65/83/fd6583a81a7fc207a1c0230cbcbb4a5b.jpg"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: nome,
                decoration: InputDecoration(
                  labelText: "Nome",
                  border: OutlineInputBorder()
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: altura,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Altura",
                    border: OutlineInputBorder()
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: peso,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Peso",
                    border: OutlineInputBorder()
                ),
              ),
            ),
            RaisedButton(
              onPressed: (){
                final imc = double.parse(peso.text) / (double.parse(altura.text) * double.parse(altura.text));
                setState(() {
                  msg = "Olá ${nome.text}, seu imc é ${imc.toStringAsFixed(2)}, você está ${estado(imc)}";
                });
               },
              textColor: Colors.white,
              color: Colors.blueAccent,
              child: Text("Calcular"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(msg),
            )
          ],
        ),
      ),
    );
  }
}

String estado(double valor) {
  if (valor <= 18.5) {
    return "Magro";
  }
  if (valor < 24.9) {
    return "Normal";
  }
  if (valor < 24.9) {
    return "Normal";
  }
  return "Sobrepeso";
}