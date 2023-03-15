import 'package:freezed_annotation/freezed_annotation.dart';
part 'journal_invoice_model.freezed.dart';
part 'journal_invoice_model.g.dart';

@freezed
class JournalInvoiceModel with _$JournalInvoiceModel {
  const factory JournalInvoiceModel({
    @JsonKey(name: 'TransactionSubLedger') required List<dynamic> transactionSubLedger,
    @JsonKey(name: 'DrAmount') required double drAmount,
    @JsonKey(name: 'CrAmount') required double crAmount,
    @JsonKey(name: 'ID') required  int id,
    @JsonKey(name: 'MasterID') required int masterID,
    @JsonKey(name: 'LedgerID') required int ledgerID,
    @JsonKey(name: 'CodeName') required String codeName,
    @JsonKey(name: 'LedgerName') required String ledgerName,
    @JsonKey(name: 'LedgerCode') required String ledgerCode,
    @JsonKey(name: 'LedgerBalance') required String ledgerBalance,
    @JsonKey(name: 'Remarks') required String remarks,
  }) = _JournalInvoiceModel;

  factory JournalInvoiceModel.fromJson(Map<String, dynamic> json) =>
      _$JournalInvoiceModelFromJson(json);
}
