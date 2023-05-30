import 'package:json_annotation/json_annotation.dart';

part 'cat_fact.g.dart';

@JsonSerializable()
class CatFact {
  @JsonKey(name: 'fact')
  final String fact;

  CatFact({required this.fact});

  factory CatFact.fromJson(Map<String, dynamic> json) =>
      _$CatFactFromJson(json);
  Map<String, dynamic> toJson() => _$CatFactToJson(this);
}
