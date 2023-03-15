import 'package:accswift/dtos/get_all_ledger_accounts_dto.dart';
import 'package:accswift/dtos/get_all_series_dto.dart';
import 'package:accswift/dtos/get_series_voucher_dto.dart';
import 'package:accswift/models/cash_party_model.dart';
import 'package:accswift/models/product_model.dart';
import 'package:accswift/models/ledger_account_model.dart';
import 'package:accswift/models/tax_model.dart';
import 'package:accswift/models/project_model.dart';
import 'package:accswift/models/depot_location_model.dart';
import 'package:accswift/models/series_model.dart';
import 'package:accswift/models/series_voucher_model.dart';

abstract class InvoiceService {
  /// Get all cashparties
  Future<List<CashPartyModel>> getAllCashParties();

  /// Get all ledger accounts
  Future<List<LedgerAccountModel>> getAllLedgerAccounts(
      GetAllLedgerAccountsDTO dto);

  /// Get all products
  Future<List<ProductModel>> getAllProducts();

  /// Get all taxes
  Future<List<TaxModel>> getAllTaxes();

  /// Get all projects
  Future<List<ProjectModel>> getAllProjects();

  /// Get all depot/location
  Future<List<DepotLocationModel>> getAllDepot();

  /// Get all series
  Future<List<SeriesModel>> getAllSeries(GetAllSeriesDTO dto);

  /// Get series voucher
  Future<SeriesVoucherModel> getSeriesVoucher(GetSeriesVoucherDTO dto);
}
