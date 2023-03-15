import 'package:accswift/models/product_model.dart';
import 'package:accswift/models/tax_model.dart';

class InvoiceItem {
  ProductModel? product;
  double? quantity;
  double? rate;
  double? discount;
  bool doDiscountedByPercentage = false;
  TaxModel? tax;
  String? remarks;

  InvoiceItem();
}
