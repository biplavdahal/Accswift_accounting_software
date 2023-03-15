import 'package:freezed_annotation/freezed_annotation.dart';

part 'tax_model.freezed.dart';
part 'tax_model.g.dart';

@freezed
class TaxModel with _$TaxModel {
  const factory TaxModel({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'Name') required String name,
    @JsonKey(name: 'Rate') required double rate,
  }) = _TaxModel;

  factory TaxModel.fromJson(Map<String, dynamic> json) =>
      _$TaxModelFromJson(json);
}
