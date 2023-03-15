import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:accswift/models/sales_invoice_model.dart';

part 'sales_model.freezed.dart';
part 'sales_model.g.dart';

@freezed
class SalesModel with _$SalesModel {
  const factory SalesModel({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'OrderNo') String? orderNo,
    @JsonKey(name: 'Date') required String date,
    @JsonKey(name: 'TotalQty') required double totalQty,
    @JsonKey(name: 'TotalAmount') required double totalAmount,
    @JsonKey(name: 'TenderAmount') required double tenderAmount,
    @JsonKey(name: 'ChangeAmount') required double changeAmount,
    @JsonKey(name: 'AdjustmentAmount') required double adjustmentAmount,
    @JsonKey(name: 'SalesDueDate') String? salesDueDate,
    @JsonKey(name: 'DueDays') int? dueDays,
    @JsonKey(name: 'TableNumber') required String tableNumber,
    @JsonKey(name: 'PrintCount') required int printCount,
    @JsonKey(name: 'IRDSync') required bool irdSync,
    @JsonKey(name: 'Status') required String status,
    @JsonKey(name: 'IsPay') required bool isPay,
    @JsonKey(name: 'InvoiceDetails')
        required List<SalesInvoiceModel> invoiceDetails,
    @JsonKey(name: 'SalesLedgerID') required int salesLedgerID,
    @JsonKey(name: 'SalesName') required String salesName,
    @JsonKey(name: 'CashPartyLedgerID') required int cashPartyLedgerID,
    @JsonKey(name: 'CashPartName') required String cashPartName,
    @JsonKey(name: 'DepotID') required int depotID,
    @JsonKey(name: 'DepotName') required String depotName,
    @JsonKey(name: 'GrossAmount') required double grossAmount,
    @JsonKey(name: 'SpecialDiscount') required double specialDiscount,
    @JsonKey(name: 'NetAmount') required double netAmount,
    @JsonKey(name: 'Tax1') required double tax1,
    @JsonKey(name: 'Tax2') required double tax2,
    @JsonKey(name: 'Tax3') required double tax3,
    @JsonKey(name: 'VAT') required double vAT,
    @JsonKey(name: 'TotalTCAmount') required double totalTCAmount,
    @JsonKey(name: 'RecurringVoucher') dynamic recurringVoucher,
    @JsonKey(name: 'SeriesID') required int seriesID,
    @JsonKey(name: 'SeriesName') required String seriesName,
    @JsonKey(name: 'IsVoucherNoEnabled') required bool isVoucherNoEnabled,
    @JsonKey(name: 'VoucherNo') required String voucherNo,
    @JsonKey(name: 'ProjectID') required int projectID,
    @JsonKey(name: 'ProjectName') required String projectName,
    @JsonKey(name: 'AccClassIDs') required List<int> accClassIDs,
    @JsonKey(name: 'Remarks') String? remarks,
    @JsonKey(name: 'CompanyID') required int companyID,
    @JsonKey(name: 'CreatedBy') required String createdBy,
    @JsonKey(name: 'CreatedDate') required String createdDate,
    @JsonKey(name: 'ModifiedBy') String? modifiedBy,
    @JsonKey(name: 'ModifiedDate') String? modifiedDate,
  }) = _SalesModel;

  factory SalesModel.fromJson(Map<String, dynamic> json) =>
      _$SalesModelFromJson(json);
}
