import 'package:flutter/material.dart';
import 'package:projeto_academia/components/NavigationRail/custom_navigation_rail.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(252, 223, 141, 167),
        body: Row(
          children: [
            const CustomNavigationRail(initialIndex: 0),
            // const VerticalDivider(thickness: 0, width: 3,),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed('/create');
                        },
                        child: const Text("Adicionar corrida")),
                  ),
                  Center(
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed('/read');
                        },
                        child: const Text("Ver corridas")),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
