import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'cat_image_service.g.dart';

@RestApi(baseUrl: "https://cataas.com")
abstract class CatImageService {
  factory CatImageService(Dio dio, {String baseUrl}) = _CatImageService;

  @GET("/cat")
  @DioResponseType(ResponseType.bytes)
  Future<HttpResponse<List<int>>> getCatImage();
}
