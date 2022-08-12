import 'package:flutter/material.dart';

class CreateController {
  String day = "";

  static bool validateDate(String value) {
    return true;
  }

  Future<void> selectDate(BuildContext context) async {
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
    // setState(() {
    day = "${temp[2]}/${temp[1]}/${temp[0]}";
    //   print("Data Formatada: $day");
    // });
  }
}
