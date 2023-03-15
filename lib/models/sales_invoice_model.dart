import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_invoice_model.freezed.dart';
part 'sales_invoice_model.g.dart';

@freezed
class SalesInvoiceModel with _$SalesInvoiceModel {
  const factory SalesInvoiceModel({
    @JsonKey(name: 'Electricity') double? electricity,
    @JsonKey(name: 'Garbage') double? garbage,
    @JsonKey(name: 'GeneralName') required String generalName,
    @JsonKey(name: 'SalesRate') required double salesRate,
    @JsonKey(name: 'VATAmount') required double vatAmount,
    @JsonKey(name: 'DiscPercentage') required double discPercentage,
    @JsonKey(name: 'DiscountAmount') required double discountAmount,
    @JsonKey(name: 'NetAmount') required double netAmount,
    @JsonKey(name: 'QtyUnitID') required int qtyUnitID,
    @JsonKey(name: 'QtyUnitName') required String qtyUnitName,
    @JsonKey(name: 'TaxID')  int? taxID,
    @JsonKey(name: 'TaxAmount') required double taxAmount,
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'MasterID') required int masterID,
    @JsonKey(name: 'ProductID') required int productID,
    @JsonKey(name: 'ProductName') required String productName,
    @JsonKey(name: 'CodeName') required String codeName,
    @JsonKey(name: 'ProductCode') required String productCode,
    @JsonKey(name: 'Quantity') required double quantity,
    @JsonKey(name: 'Amount') required double amount,
    @JsonKey(name: 'Remarks') required String remarks,
  }) = _SalesInvoiceModel;

  factory SalesInvoiceModel.fromJson(Map<String, dynamic> json) =>
      _$SalesInvoiceModelFromJson(json);
}
