import 'package:flutter/material.dart';
import 'package:projeto_academia/utils/key/key.dart';
import 'package:projeto_academia/utils/routes.dart';

void main() async {
  runApp(MyApp(
    key: UniqueKey(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: routes,
      scaffoldMessengerKey: scaffoldKey,
    );
  }
}
