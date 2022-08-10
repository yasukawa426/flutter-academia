import 'package:gsheets/gsheets.dart';

class Read {
  ///Carrega o valor de uma célula especifica na [sheet]
  Future<String> readCell(Worksheet sheet, int row, int column) {
    return sheet.values.value(column: column, row: row);
  }

  ///Carrega uma coluna inteira
  Future<List<String>> readColumn(Worksheet sheet, int column) {
    return sheet.values.column(column, fromRow: 2);
  }

  ///Carrega uma coluna inteira
  Future<List<String>> readRow(Worksheet sheet, int row) {
    return sheet.values.row(row);
  }
}
