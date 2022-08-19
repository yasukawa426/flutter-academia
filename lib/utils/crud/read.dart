import 'package:gsheets/gsheets.dart';
import 'package:projeto_academia/model/sheetRow.dart';

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

  ///Devolve uma lista como todos os rows.
  static Future<List<SheetRow>> readAllRows(Worksheet sheet) async {
    List<SheetRow> sheetRows = [];
    List<List<String>> rows = await sheet.values.allRows(length: 6, fromRow: 2);

    for (List<String> row in rows) {
      sheetRows.add(SheetRow(
          totalTime: row[0],
          day: row[1],
          distance: row[2],
          kcal: row[3],
          obs: row[4],
          weight: row[5]));
    }

    return sheetRows;
  }
}
