import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';
import 'package:projeto_academia/components/NavigationRail/custom_navigation_rail.dart';
import 'package:projeto_academia/main.dart';
import 'package:projeto_academia/model/sheetRow.dart';
import 'package:projeto_academia/utils/crud/read.dart';



class ReadPage extends StatefulWidget {
  const ReadPage({Key? key}) : super(key: key);

  @override
  State<ReadPage> createState() => _ReadPageState();
}

class _ReadPageState extends State<ReadPage> {
  late List<SheetRow> rows;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: FutureBuilder(
        future: _getChildren(MyApp.sheet),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data is List) {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ListView(
                children: <Widget>[...snapshot.data as List],
              ),
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    ));
  }

  Future<List<Widget>> _getChildren(Worksheet sheet) async {
    rows = await Read.readAllRows(sheet);
    print("All rows: $rows");
    List<Text> children = [];
    for (SheetRow row in rows) {
      String data = "Dia: ${row.day} ";
      data += "Tempo Total: ${row.totalTime} ";
      data += "Distância: ${row.distance} ";
      data += "Kcals Queimadas: ${row.kcal} ";
      data += "Observações: ${row.obs} ";
      data += "Weight: ${row.weight} ";
      children.add(Text(data));
    }
    print("Children: $children");
    return children;
  }
}
