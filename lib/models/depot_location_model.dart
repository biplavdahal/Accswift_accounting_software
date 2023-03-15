import 'package:freezed_annotation/freezed_annotation.dart';

part 'depot_location_model.freezed.dart';
part 'depot_location_model.g.dart';

@freezed
class DepotLocationModel with _$DepotLocationModel {
  const factory DepotLocationModel({
    @JsonKey(name: 'city') String? city,
    @JsonKey(name: 'ContactPerson') required String contactPerson,
    @JsonKey(name: 'DepotAddress') required String depotAddress,
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'DepotName') required String depotName,
    @JsonKey(name: 'LicenceNo') String? licenceNo,
    @JsonKey(name: 'Mobile') String? mobile,
    @JsonKey(name: 'PostalCode') required String postalCode,
    @JsonKey(name: 'RegNo') String? regNo,
    @JsonKey(name: 'Remarks') String? remarks,
    @JsonKey(name: 'Telephone') required String telephone,
  }) = _DepotLocationModel;

  factory DepotLocationModel.fromJson(Map<String, dynamic> json) =>
      _$DepotLocationModelFromJson(json);
}
