import 'package:flutter/material.dart';


class CustomNavigationRail extends StatefulWidget {
  const CustomNavigationRail({Key? key, required this.initialIndex})
      : super(key: key);
  final int initialIndex;
  @override
  State<CustomNavigationRail> createState() =>
      _CustomNavigationRailState(initialIndex);
}

class _CustomNavigationRailState extends State<CustomNavigationRail> {
  _CustomNavigationRailState(this._selectedIndex);
  int _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
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
    );
  }
}
