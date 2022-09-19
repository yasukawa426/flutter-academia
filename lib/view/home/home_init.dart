import 'package:flutter/material.dart';
import 'package:projeto_academia/view/create/create_page.dart';
import 'package:projeto_academia/view/home/home_page.dart';
import 'package:projeto_academia/view/read/read_page.dart';

class HomeInit extends StatefulWidget {
  const HomeInit({Key? key})
      : super(key: key);

  @override
  State<HomeInit> createState() =>
      _HomeInitState();
}

class _HomeInitState extends State<HomeInit> {
  _HomeInitState();
  int _selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          NavigationRail(
            backgroundColor: const Color.fromARGB(255, 14, 14, 14),
            useIndicator: false,
            selectedIndex: _selectedIndex,
            labelType: NavigationRailLabelType.all,
            unselectedLabelTextStyle:
                const TextStyle(color: Color.fromARGB(255, 125, 39, 68)),
            selectedLabelTextStyle:
                const TextStyle(color: Color.fromARGB(255, 216, 65, 116)),
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(Icons.home, color: Color.fromARGB(255, 216, 65, 116)),
                label: Text("home"),
              ),
              NavigationRailDestination(
                icon: Icon(
                  Icons.directions_run,
                  color: Color.fromARGB(255, 216, 65, 116),
                ),
                label: Text("run"),
              ),
              NavigationRailDestination(
                icon: Icon(
                  Icons.book,
                  color: Color.fromARGB(255, 216, 65, 116),
                ),
                label: Text("read"),
              ),
            ],
          ),
          Expanded(
            child: Center(child: _getPage()),
          )
        ],
      ),
    );
  }

  _getPage() {
    switch (_selectedIndex) {
      case 0:
        return const HomePage();

      case 1:
        return const CreatePage();

      case 2:
        return const ReadPage();
        
      default:
        return const HomePage();
    }
  }
}
