///Representa uma linha na planilha
class SheetRow {
  final String totalTime;
  final String day;
  final String distance;
  final String kcal;
  final String obs;
  final String weight;

  SheetRow(
      {required this.totalTime,
      required this.day,
      required this.distance,
      required this.kcal,
      this.obs = 'n/a',
      required this.weight});

  List get row {
    return [totalTime, day, distance, kcal, obs, weight];
  }
}
