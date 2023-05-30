import 'dart:typed_data';

class CatState {}

class CatInitial extends CatState {}

class CatLoading extends CatState {}

class CatLoaded extends CatState {
  final String catFact;
  final Uint8List catImage;
  final DateTime dateTime;

  CatLoaded(this.catFact, this.catImage, this.dateTime);
}

class CatError extends CatState {
  final String errorMessage;

  CatError(this.errorMessage);
}
