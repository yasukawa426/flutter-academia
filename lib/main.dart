import 'package:flutter/material.dart';
import 'package:projeto_academia/utils/routes.dart';

void main() async {
  runApp(MyApp(key: UniqueKey(),));
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
      routes: routes,
    );
  }
}
