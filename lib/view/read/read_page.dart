import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:projeto_academia/components/NavigationRail/custom_navigation_rail.dart';

class ReadPage extends StatefulWidget {
  const ReadPage({Key? key}) : super(key: key);

  @override
  State<ReadPage> createState() => _ReadPageState();
}

class _ReadPageState extends State<ReadPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Row(
      children: [
        const CustomNavigationRail(initialIndex: 2),
        Scaffold(
          body: Container(),
        )
      ],
    ));
  }
}
