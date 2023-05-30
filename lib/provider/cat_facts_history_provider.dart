import 'package:cats/features/facts_history/domain/models/cat_history_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CatFactsHistoryProvider {
  Box<CatHistoryModel> box = Hive.box('catHistoryBox');

  Future<void> saveCatFact(String fact, DateTime dateTime) async {
    await box.add(CatHistoryModel(fact, dateTime));
  }

  List<CatHistoryModel> getAllHistoryFacts() {
    return box.values.toList();
  }
}
