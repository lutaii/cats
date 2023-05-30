import 'package:cats/features/cat_fact/domain/repository/impl/cat_repository_impl.dart';
import 'package:cats/provider/cat_facts_history_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repository/cat_repository.dart';
import 'cat_fact_states.dart';

class CatCubit extends Cubit<CatState> {
  CatCubit() : super(CatInitial());

  final CatRepository _repository = CatRepositoryImpl();

  Future<void> fetchCatData() async {
    emit(CatLoading());
    try {
      final fact = await _repository.getCatFact();
      final image = await _repository.getCatImage();
      final dateTime = DateTime.now();
      await CatFactsHistoryProvider().saveCatFact(fact, dateTime);
      emit(CatLoaded(fact, image, dateTime));
    } on DioError catch (e) {
      emit(CatError(e.message));
    }
  }
}
