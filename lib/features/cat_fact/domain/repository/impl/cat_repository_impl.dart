import 'dart:typed_data';
import 'package:cats/features/cat_fact/data/services/cat_image_service.dart';
import 'package:dio/dio.dart';

import '../../../data/services/cat_fact_service.dart';
import '../cat_repository.dart';

class CatRepositoryImpl implements CatRepository {
  final Dio _dio = Dio();

  @override
  Future<String> getCatFact() async {
    final response = await CatFactService(_dio).getFact();
    return response.fact;
  }

  @override
  Future<Uint8List> getCatImage() async {
    final response = await CatImageService(_dio).getCatImage();
    return Uint8List.fromList(response.data);
  }
}
