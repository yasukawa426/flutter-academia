import 'package:gsheets/gsheets.dart';
import 'package:projeto_academia/model/sheetRow.dart';

class Create {
  ///Insere uma coluna com os dados de um [SheetRow]. Retorna 'true' se operação completar com sucesso.
  static Future<bool> insertIntoRow(
    Worksheet sheet,
    int row,
    SheetRow sheetRow,
  ) {
    List values = sheetRow.row;
    return sheet.values.insertRow(row, values);
  }

  ///Insere uma coluna no final da planilha com os dados um [SheetRow]. Retorna 'true' se operação completar com sucesso.
  static Future<bool> appendRow(Worksheet sheet, SheetRow sheetRow) {
    List values = sheetRow.row;
    return sheet.values.appendRow(values);
  }

  ///Insere um valor em uma célula especifica.
  static Future<bool> insertIntoCell(
      Worksheet sheet, int column, int row, value) {
    return sheet.values.insertValue(value, column: column, row: row);
  }
}
