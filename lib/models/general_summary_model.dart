import 'package:freezed_annotation/freezed_annotation.dart';

part 'general_summary_model.freezed.dart';
part 'general_summary_model.g.dart';

@freezed
class GeneralSummary with _$GeneralSummary {
  const factory GeneralSummary({
    @JsonKey(name: 'AmountThisMonth') double? amountThisMonth,
    @JsonKey(name: 'AmountThisYear') double? amountThisYear,
    @JsonKey(name: 'Balance') String? balance,
    @JsonKey(name: 'NoOfVouchers') int? noOfVouchers,
    @JsonKey(name: 'Title') String? title,
  }) = _GeneralSummary;

  factory GeneralSummary.fromJson(Map<String, dynamic> json) =>
      _$GeneralSummaryFromJson(json);
}
