import 'package:freezed_annotation/freezed_annotation.dart';

part 'series_voucher_model.freezed.dart';
part 'series_voucher_model.g.dart';

@freezed
class SeriesVoucherModel with _$SeriesVoucherModel {
  const factory SeriesVoucherModel({
    @JsonKey(name: 'VoucherNO') required String voucherNo,
    @JsonKey(name: 'VoucherNoType') required String type,
  }) = _SeriesVoucherModel;

  factory SeriesVoucherModel.fromJson(Map<String, dynamic> json) =>
      _$SeriesVoucherModelFromJson(json);
}
