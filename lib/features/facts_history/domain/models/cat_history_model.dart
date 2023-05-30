import 'package:hive/hive.dart';

part 'cat_history_model.g.dart';

@HiveType(typeId: 1)
class CatHistoryModel extends HiveObject {
  @HiveField(0)
  late String fact;

  @HiveField(1)
  late DateTime dateTime;

  CatHistoryModel(this.fact, this.dateTime);
}
