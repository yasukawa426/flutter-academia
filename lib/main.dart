import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';
import 'package:projeto_academia/utils/chave/key.dart';

void main() async {
  // init GSheets
  final gsheets = GSheets(GoogleKey.credentials);
  // fetch spreadsheet by its id
  final ss = await gsheets.spreadsheet(GoogleKey.spreasheetId);
  final sheet = ss.worksheetByIndex(0)!;
  //Pega tds os dados da coluna, pulando a primeira linha
  List<String> timeColumn = await sheet.values.column(1, fromRow: 2);
  List<String> dayColumn = await sheet.values.column(2, fromRow: 2);
  List<String> distanceColumn = await sheet.values.column(3, fromRow: 2);
  List<String> kcalColumn = await sheet.values.column(4, fromRow: 2);
  List<String> obsColumn = await sheet.values.column(5, fromRow: 2);
  List<String> weightColumn = await sheet.values.column(6, fromRow: 2);
  print("Time: $timeColumn");
  print("Day: $dayColumn");
  print("Distance: $distanceColumn");
  print("Kcal: $kcalColumn");
  print("Obs: $obsColumn");
  print("Weight: $weightColumn"); 
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inicio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bora"),
      ),
      body: const Text("Oi"),
    );
  }
}
