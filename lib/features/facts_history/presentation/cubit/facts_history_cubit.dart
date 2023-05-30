import 'package:cats/features/facts_history/presentation/cubit/history_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../provider/cat_facts_history_provider.dart';

class FactsHistoryCubit extends Cubit<HistoryState> {
  FactsHistoryCubit() : super(HistoryInitial());

  final CatFactsHistoryProvider _historyProvider = CatFactsHistoryProvider();

  void fetchHistory() {
    final items = _historyProvider.getAllHistoryFacts();
    if (items.isEmpty) {
      emit(HistoryInitial());
    } else {
      emit(HistoryLoaded(items));
    }
  }
}
