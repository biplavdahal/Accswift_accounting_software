import 'package:accswift/dtos/add_sales_dto.dart';
import 'package:accswift/dtos/delete_sales_invoice_dto.dart';
import 'package:accswift/dtos/fetch_sales_invoice_master_dto.dart';
import 'package:accswift/models/sales_model.dart';

abstract class SalesService {
  /// Getter for all sales list [SalesModel]
  List<SalesModel> get sales;

  /// Set sales list [SalesModel]
  set sales(List<SalesModel> value);

  /// Getter for boolean value to indicate if there is more data to be loaded
  bool get hasMoreData;

  /// Fetch all sales list
  Future<List<SalesModel>> fetchSalesInvoiceMaster(
      FetchSalesInvoiceMasterDTO dto);

  /// Delete sales invoice
  Future<void> deleteSalesInvoice(DeleteSalesInvoiceDTO dto);

  /// Create sales invoice
  Future<void> addSales(AddSalesDTO dto);
}
