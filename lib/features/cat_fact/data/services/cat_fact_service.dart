import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../domain/models/cat_fact.dart';

part 'cat_fact_service.g.dart';

@RestApi(baseUrl: "https://catfact.ninja")
abstract class CatFactService {
  factory CatFactService(Dio dio, {String baseUrl}) = _CatFactService;

  @GET("/fact")
  Future<CatFact> getFact();
}
