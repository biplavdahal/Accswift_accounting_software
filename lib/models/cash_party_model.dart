import 'package:freezed_annotation/freezed_annotation.dart';

part 'cash_party_model.freezed.dart';
part 'cash_party_model.g.dart';

@freezed
class CashPartyModel with _$CashPartyModel {
  const factory CashPartyModel({
    @JsonKey(name: 'CodeName') required String codeName,
    @JsonKey(name: 'GroupID') required int groupId,
    @JsonKey(name: 'LedgerBalance') required String ledgerBalance,
    @JsonKey(name: 'LedgerCode') required String ledgerCode,
    @JsonKey(name: 'LedgerName') required String ledgerName,
    @JsonKey(name: 'LedgerID') required int ledgerId,
  }) = _CashPartyModel;

  factory CashPartyModel.fromJson(Map<String, dynamic> json) =>
      _$CashPartyModelFromJson(json);
}
