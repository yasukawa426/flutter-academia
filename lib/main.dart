import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gsheets/gsheets.dart';
import 'package:projeto_academia/utils/chave/key.dart';
import 'package:projeto_academia/utils/key/key.dart';
import 'package:projeto_academia/utils/routes.dart';

void main() async {
  //Acha a planilha
  final gsheets = GSheets(GoogleKey.credentials);
  //Pega a primeira folha e salva na variavel [sheet]
  MyApp.sheet = (await gsheets.spreadsheet(GoogleKey.spreasheetId)).worksheetByIndex(0)!;


  runApp(MyApp(
    key: UniqueKey(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  static late final Worksheet sheet;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //Permite chamar um snackbar dentro de qualquer scaffold.
  // final _scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inicio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: routes,
      scaffoldMessengerKey: scaffoldKey,
      localizationsDelegates: const [GlobalMaterialLocalizations.delegate],
      supportedLocales: const [Locale("pt", "BR"), Locale("en", "US")],
    );
  }
}
