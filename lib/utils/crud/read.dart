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

  ///Devolve uma lista de lista de colunas. Ex: [[A, A1, A2,], [B, B1, B2,], [C, C1, C2,], [D, D1, D2,],]
  static Future<List<List<String>>> readAllColumns(Worksheet sheet) {
    return sheet.values.allColumns(length: 6);
  }
}
