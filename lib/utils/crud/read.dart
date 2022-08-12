import 'package:gsheets/gsheets.dart';

class Read {
  ///Carrega o valor de uma célula especifica na [sheet]
  static Future<String> readCell(Worksheet sheet, int row, int column) {
    return sheet.values.value(column: column, row: row);
  }

  ///Carrega uma coluna inteira
  static Future<List<String>> readColumn(Worksheet sheet, int column) {
    return sheet.values.column(column, fromRow: 2);
  }

  ///Carrega uma linha inteira
  static Future<List<String>> readRow(Worksheet sheet, int row) {
    return sheet.values.row(row);
  }

  ///Carrega uma matriz com todas as colunas
  static Future<List<List<String>>> readAllRows(Worksheet sheet) {
    return sheet.values.allColumns(length: 6);
  }
}
