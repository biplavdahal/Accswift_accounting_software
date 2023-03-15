import 'package:accswift/dtos/delete_purchase_invoice_dto.dart';
import 'package:accswift/models/purchase_model.dart';

abstract class PurchaseService {
  /// Getter for all purchase lists [PurchaseModel]
  List<PurchaseModel> get purchases;

  /// Set purchases list [PurchaseModel]
  set purchases(List<PurchaseModel> value);

  /// Fetch all purchases list
  Future<List<PurchaseModel>> fetchPurchaseInvoiceMaster();

  /// Delete purchase invoice
  Future<void> deletePurchaseInvoice(DeletePurchaseInvoiceDTO dto);
}
