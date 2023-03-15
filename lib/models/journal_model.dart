import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:accswift/models/journal_invoice_model.dart';

part 'journal_model.freezed.dart';
part 'journal_model.g.dart';

@freezed
class JournalModel with _$JournalModel {
  const factory JournalModel({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'Date') required double date,
    @JsonKey(name: 'DrAmount') required int drAmount,
    @JsonKey(name: 'CrAmount') required int crAmount,
    @JsonKey(name: 'Name') required String name,
    @JsonKey(name: 'Balance') required String balance,
    @JsonKey(name: 'Amount') required int amount,
    @JsonKey(name: 'SubLedgerID') required int subLedgerID,
    @JsonKey(name: 'DrCr') required String drCr,
    @JsonKey(name: 'VoucherNo') required String voucherNo,
    @JsonKey(name: 'SeriesID') required int seriesID,
    @JsonKey(name: 'SeriesName') required String seriesName,
    @JsonKey(name: 'CodeName') required String codeName,
    @JsonKey(name: 'LedgerName') required String ledgerName,
    @JsonKey(name: 'LedgerCode') required String ledgerCode,
    @JsonKey(name: 'LedgerBalance') required String ledgerBalance,
    @JsonKey(name: 'RecurringVoucher') dynamic recurringVoucher,
    @JsonKey(name: 'IsVoucherNoEnabled') required bool isVoucherNoEnabled,
    @JsonKey(name: 'ProjectID') required int projectID,
    @JsonKey(name: 'ProjectName') required String projectName,
    @JsonKey(name: 'Remarks') required String remarks,
  }) = _JournalModel;

  factory JournalModel.fromJson(Map<String, dynamic> json) =>
      _$JournalModelFromJson(json);
}
