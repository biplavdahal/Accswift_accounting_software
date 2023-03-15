import 'package:freezed_annotation/freezed_annotation.dart';

part 'ledger_account_model.freezed.dart';
part 'ledger_account_model.g.dart';

@freezed
class LedgerAccountModel with _$LedgerAccountModel {
  const factory LedgerAccountModel({
    @JsonKey(name: 'CodeName') required String codeName,
    @JsonKey(name: 'GroupID') required int groupId,
    @JsonKey(name: 'LedgerBalance') required String ledgerBalance,
    @JsonKey(name: 'LedgerCode') required String ledgerCode,
    @JsonKey(name: 'LedgerID') required int ledgerId,
    @JsonKey(name: 'LedgerName') required String ledgerName,
  }) = _LedgerAccountModel;

  factory LedgerAccountModel.fromJson(Map<String, dynamic> json) =>
      _$LedgerAccountModelFromJson(json);
}
