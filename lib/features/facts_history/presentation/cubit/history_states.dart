import 'package:cats/features/facts_history/domain/models/cat_history_model.dart';

class HistoryState {}

class HistoryInitial extends HistoryState {}

class HistoryLoaded extends HistoryState {
  final List<CatHistoryModel> items;

  HistoryLoaded(this.items);
}
