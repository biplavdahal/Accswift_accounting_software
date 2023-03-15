import 'package:freezed_annotation/freezed_annotation.dart';

part 'series_model.freezed.dart';
part 'series_model.g.dart';

@freezed
class SeriesModel with _$SeriesModel {
  const factory SeriesModel({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'Name') required String name,
  }) = _SeriesModel;

  factory SeriesModel.fromJson(Map<String, dynamic> json) =>
      _$SeriesModelFromJson(json);
}
