import 'dart:typed_data';

abstract class CatRepository {
  Future<String> getCatFact();
  Future<Uint8List> getCatImage();
}
