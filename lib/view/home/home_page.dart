import 'package:flutter/material.dart';
import 'package:projeto_academia/view/home/home_init.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(252, 223, 141, 167),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [Center(child: Text("BEEEEM VINDO A HOME LUCAAAAAA!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"))
          ],
        ),
      ),
    );
  }
}
