import 'package:flutter/material.dart';
import 'package:projeto_academia/view/home/home_init.dart';
import 'package:projeto_academia/controller/create_controller.dart';
import 'package:projeto_academia/main.dart';
import 'package:projeto_academia/model/sheetRow.dart';
import 'package:projeto_academia/utils/crud/create.dart';
import 'package:projeto_academia/utils/key/key.dart';

class CreatePage extends StatelessWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor:Color.fromARGB(252, 223, 141, 167),
      body: SingleChildScrollView(child: CustomForm()),
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
  final CreateController _controller = CreateController();
  late String time, distance, kcal, weight, minute, second;
  String hour = "00";
  late String? obs;
  final double width = 50;

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
                    const Text("Duração (hh:mm:ss)"),
                    //TODO: Corrigir o validator de todos
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: width,
                            child: TextFormField(
                              maxLength: 2,
                              keyboardType: TextInputType.number,
                              initialValue: "00",
                              decoration: const InputDecoration(
                                  counterText: "",
                                  labelText: "hh",
                                  border: OutlineInputBorder()),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor, digite um texto';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                hour = value;
                              },
                            ),
                          ),
                          const Text(":"),
                          SizedBox(
                            width: width,
                            child: TextFormField(
                              maxLength: 2,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  counterText: "",
                                  labelText: "mm",
                                  border: OutlineInputBorder()),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor, digite um texto';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                minute = value;
                              },
                            ),
                          ),
                          const Text(":"),
                          SizedBox(
                            width: width,
                            child: TextFormField(
                              maxLength: 2,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  labelText: "ss",
                                  border: OutlineInputBorder(),
                                  counterText: ""),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor, digite um texto';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                second = value;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.datetime,
                      key: Key(_controller.day.toString()),
                      onTap: () {
                        _controller.selectDate(context);
                      },
                      initialValue: _controller.day.toString(),
                      decoration: const InputDecoration(
                          counterText: "",
                          labelText: "Dia (dd/mm/ano)",
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, digite um texto';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        _controller.day = value;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true ),
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
                          time = "$hour:$minute:$second";
                          //Validate() retorna true se o form form valido
                          if (_formKey.currentState!.validate()) {
                            late bool success;

                            if (obs == null || obs == '') {
                              success = await Create.appendRow(
                                  MyApp.sheet,
                                  SheetRow(
                                      totalTime: time,
                                      day: _controller.day,
                                      distance: distance,
                                      kcal: kcal,
                                      weight: weight));
                            } else {
                              success = await Create.appendRow(
                                  MyApp.sheet,
                                  SheetRow(
                                      totalTime: time,
                                      day: _controller.day,
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
}
