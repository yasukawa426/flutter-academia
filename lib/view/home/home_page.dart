import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  //TODO: implementar checagem de conexão para poder apertar os botoes
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Oiiiii"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/create');
                },
                child: const Text("Adicionar corrida")),
          )
        ],
      ),
    );
  }
}
