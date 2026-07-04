import '../models/history_model.dart';

class HistoryService {
  static final List<HistoryModel> histories = [];

  static void addHistory(
    String speech,
    String translation,
  ) {
    histories.add(
      HistoryModel(
        speech: speech,
        translation: translation,
        createdAt: DateTime.now(),
      ),
    );
  }

  static List<HistoryModel> getHistory() {
    return histories;
  }
}