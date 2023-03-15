import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:accswift/models/purchase_invoice_model.dart';
part 'purchase_model.freezed.dart';
part 'purchase_model.g.dart';

@freezed
class PurchaseModel with _$PurchaseModel {
  const factory PurchaseModel({
    @JsonKey(name: 'AccClassID') List<int>? accClassID,
    @JsonKey(name: 'CashPartName') required String cashPartName,
    @JsonKey(name: 'CashPartyLedgerID') required int cashPartyLedgerID,
    @JsonKey(name: 'CompanyID') required int companyID,
    @JsonKey(name: 'CreatedBy') required String createdBy,
    @JsonKey(name: 'CreatedDate') required String createdDate,
    @JsonKey(name: 'CustomDuty') required double customDuty,
    @JsonKey(name: 'Date') required String date,
    @JsonKey(name: 'DepotID') required int depotID,
    @JsonKey(name: 'DepotName') required String depotName,
    @JsonKey(name: 'Freight') required double freight,
    @JsonKey(name: 'GrossAmount') required double grossAmount,
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'IsVouceherEnabled') bool? isVouceherEnabled,
    @JsonKey(name: 'NetAmount') required double netAmount,
    @JsonKey(name: 'OrderNo') String? orderNo,
    @JsonKey(name: 'PartyBillNumber') int? partyBillNumber,
    @JsonKey(name: 'ProjectID') required int projectID,
    @JsonKey(name: 'ProjectName') required String projectName,
    @JsonKey(name: 'PurchaseInvoiceDetails')
        List<PurchaseInvoiceModel>? purchaseInvoiceDetails,
    @JsonKey(name: 'PurchaseDueDate') String? purchaseDueDate,
    @JsonKey(name: 'PurchaseLedgerID') required int purchaseLedgerID,
    @JsonKey(name: 'PurchaseName') required String purchaseName,
    @JsonKey(name: 'Remarks') String? remarks,
    @JsonKey(name: 'SeriesID') required int seriesID,
    @JsonKey(name: 'SeriesName') required String seriesName,
    @JsonKey(name: 'SpecialDiscount') required double specialDiscount,
    @JsonKey(name: 'TotalAmount') required double totalAmount,
    @JsonKey(name: 'TotalQty') required double totalQty,
    @JsonKey(name: 'VoucherNo') required String voucherNo,
    @JsonKey(name: 'TotalTCAmount') required double totalTCAmount,
    @JsonKey(name: 'VAT') required double vAT,
  }) = _PurchaseModel;

  factory PurchaseModel.fromJson(Map<String, dynamic> json) =>
      _$PurchaseModelFromJson(json);
}
