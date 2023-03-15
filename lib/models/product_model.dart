import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    @JsonKey(name: 'ClosingQty') required double closingQuantity,
    @JsonKey(name: 'CodeName') required String codeName,
    @JsonKey(name: 'GroupID') required int groupId,
    @JsonKey(name: 'GroupName') required String groupName,
    @JsonKey(name: 'IsInventory') required bool isInventory,
    @JsonKey(name: 'IsVAT') required bool isVat,
    @JsonKey(name: 'ProductCode') required String productCode,
    @JsonKey(name: 'ProductID') required int productId,
    @JsonKey(name: 'ProductName') required String productName,
    @JsonKey(name: 'PurchaseRate') required double purchaseRate,
    @JsonKey(name: 'QtyUnitID') required int qtyUnitId,
    @JsonKey(name: 'QtyUnitName') required String qtyUnitName,
    @JsonKey(name: 'SalesRate') required double salesRate,
    @JsonKey(name: 'TaxID') int? taxId,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
