class HistoryModel {
  final String speech;
  final String translation;
  final DateTime createdAt;

  HistoryModel({
    required this.speech,
    required this.translation,
    required this.createdAt,
  });
}