import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';
import 'package:projeto_academia/components/NavigationRail/custom_navigation_rail.dart';
import 'package:projeto_academia/model/sheetRow.dart';
import 'package:projeto_academia/utils/chave/key.dart';
import 'package:projeto_academia/utils/crud/create.dart';
import 'package:projeto_academia/utils/key/key.dart';

class CreatePage extends StatelessWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(252, 223, 141, 167),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            CustomNavigationRail(
              initialIndex: 1,
            ),
            CustomForm(),
          ],
        ),
      ),
    );
  }
}

class CustomForm extends StatefulWidget {
  const CustomForm({Key? key}) : super(key: key);

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  //Cria uma chave global para indentificar o form e permitir a validação dele
  //Obs: É uma 'GlobalKey<FormState>', não uma 'GlobalKey<CustomFormState>'
  final _formKey = GlobalKey<FormState>();
  final ScaffoldMessengerState? _scaffold = scaffoldKey.currentState;
  late String time, distance, kcal, weight;
  late String? obs;
  String day = "";
  late Worksheet sheet;

  @override
  void initState() {
    super.initState();
    //Acha a planilha
    final gsheets = GSheets(GoogleKey.credentials);
    //Pega a primeira folha e salva na variavel [sheet]
    gsheets
        .spreadsheet(GoogleKey.spreasheetId)
        .then((value) => sheet = value.worksheetByIndex(0)!);
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    print("args: $args");
    return Form(
        key: _formKey,
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //TODO: Corrigir o validator de todos
                    TextFormField(
                      keyboardType: TextInputType.datetime,
                      decoration: const InputDecoration(
                          labelText: "Tempo Total (hh:mm:ss)",
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, digite um texto';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        time = value;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      //TODO: mudar pra um date picker
                      keyboardType: TextInputType.datetime,
                      key: Key(day.toString()),
                      onTap: _selectDate,
                      initialValue: day.toString(),
                      decoration: const InputDecoration(
                          labelText: "Dia (dd/mm/ano)",
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, digite um texto';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        day = value;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      decoration: const InputDecoration(
                          labelText: "Distância", border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, digite um texto';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        distance = value;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          labelText: "Kcal Queimada",
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, digite um texto';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        kcal = value;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                          labelText: "Observações (opcional)",
                          border: OutlineInputBorder()),
                      onChanged: (value) {
                        obs = value;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      decoration: const InputDecoration(
                          labelText: "Peso (kg)", border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, digite um texto';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        weight = value;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          //Validate() retorna true se o form form valido
                          if (_formKey.currentState!.validate()) {
                            late bool success;

                            if (obs == null || obs == '') {
                              success = await Create.appendRow(
                                  sheet,
                                  SheetRow(
                                      totalTime: time,
                                      day: day,
                                      distance: distance,
                                      kcal: kcal,
                                      weight: weight));
                            } else {
                              success = await Create.appendRow(
                                  sheet,
                                  SheetRow(
                                      totalTime: time,
                                      day: day,
                                      distance: distance,
                                      kcal: kcal,
                                      weight: weight,
                                      obs: obs as String));
                            }

                            if (success == true) {
                              _scaffold!.showSnackBar(
                                const SnackBar(
                                    backgroundColor: Colors.blue,
                                    content: Text(
                                        'Adicionado à planilha com sucesso!')),
                              );
                              //Limpa o form
                              _formKey.currentState!.reset();
                            } else {
                              _scaffold!.showSnackBar(
                                const SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text('Falha ao adicionar :(')),
                              );
                            }
                          }
                        },
                        child: const Text("Finalizar"))
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Future<void> _selectDate() async {
    FocusScope.of(context).requestFocus(FocusNode());
    DateTime today = DateTime.now();
    DateTime? picked = await showDatePicker(
        locale: const Locale("pt", "BR"),
        context: context,
        initialDate: today,
        firstDate: today.subtract(const Duration(days: 2)),
        lastDate: today.add(const Duration(days: 2)));

    day = picked.toString().trim();
    day = day.split(" ")[0];
    List<String> temp = day.split("-");
    setState(() {
      day = "${temp[2]}/${temp[1]}/${temp[0]}";
      print("Data Formatada: $day");
    });
  }
}
