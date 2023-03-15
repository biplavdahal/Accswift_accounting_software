import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_invoice_model.freezed.dart';
part 'purchase_invoice_model.g.dart';

@freezed
class PurchaseInvoiceModel with _$PurchaseInvoiceModel {
  const factory PurchaseInvoiceModel({
    @JsonKey(name: 'Amount') required double amount,
    @JsonKey(name: 'CodeName') required String codeName,
    @JsonKey(name: 'CustomDuty') required double customDuty,
    @JsonKey(name: 'DiscPercentage') required double discPercentage,
    @JsonKey(name: 'DiscountAmount') required double discountAmount,
    @JsonKey(name: 'Freight') required double freight,
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'MasterID') required int masterID,
    @JsonKey(name: 'NetAmount') required double netAmount,
    @JsonKey(name: 'ProductCode') required String productCode,
    @JsonKey(name: 'ProductID') required int productID,
    @JsonKey(name: 'ProductName') required String productName,
    @JsonKey(name: 'PurchaseRate') required double purchaseRate,
    @JsonKey(name: 'QtyUnitID') required int qtyUnitID,
    @JsonKey(name: 'QtyUnitName') required String qtyUnitName,
    @JsonKey(name: 'Quantity') required double quantity,
    @JsonKey(name: 'Remarks') required String remarks,
    @JsonKey(name: 'TaxAmount') required double taxAmount,
    @JsonKey(name: 'TaxID') required int taxID,
    @JsonKey(name: 'VATAmount') required double vatAmount,
  }) = _PurchaseInvoiceModel;

  factory PurchaseInvoiceModel.fromJson(Map<String, dynamic> json) =>
      _$PurchaseInvoiceModelFromJson(json);
}
