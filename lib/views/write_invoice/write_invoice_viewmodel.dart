import 'package:accswift/core/base/base_viewmodel.dart';
import 'package:accswift/core/locator.dart';
import 'package:accswift/core/logger.dart';
import 'package:accswift/dtos/add_sales_dto.dart';
import 'package:accswift/dtos/get_all_ledger_accounts_dto.dart';
import 'package:accswift/dtos/get_all_series_dto.dart';
import 'package:accswift/dtos/get_series_voucher_dto.dart';
import 'package:accswift/helpers/api_error_helpers.dart';
import 'package:accswift/services/invoice_service.dart';
import 'package:accswift/services/sales_service.dart';
import 'package:accswift/views/write_invoice/write_invoice_arguments.dart';
import 'package:accswift/models/sales_model.dart';
import 'package:accswift/views/write_invoice/helpers/invoice_item_model.dart';
import 'package:accswift/models/cash_party_model.dart';
import 'package:accswift/models/product_model.dart';
import 'package:accswift/models/ledger_account_model.dart';
import 'package:accswift/models/tax_model.dart';
import 'package:accswift/models/series_model.dart';
import 'package:accswift/models/depot_location_model.dart';
import 'package:accswift/models/project_model.dart';
import 'package:accswift/models/purchase_model.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

class WriteInvoiceViewModel extends BaseViewModel
    with CustomLogger<WriteInvoiceViewModel> {
  // Services
  final _invoiceService = locator<InvoiceService>();
  final _saleService = locator<SalesService>();

  // Data

  bool _isEdit = false;
  bool get isEdit => _isEdit;

  late InvoiceType _type;
  late SalesModel _sales;
  SalesModel get sales => _sales;

  late PurchaseModel _purchase;
  PurchaseModel get purchase => _purchase;

  late String _viewTitle;
  String get viewTitle => _viewTitle;
  late String _accountType;
  String get accountType => _accountType;

  int _currentStep = 0;
  int get currentStep => _currentStep;
  set currentStep(int value) {
    _currentStep = value;
    state = free;
  }

  String? voucherNumber;
  String? voucherNumberType;
  String? invoiceDate;
  CashPartyModel? cashPartyAccount;
  LedgerAccountModel? invoiceAccount;
  ProjectModel? project;
  DepotLocationModel? depotLocation;
  SeriesModel? series;

  final List<InvoiceItem> invoiceItems = [];
  void onAddNewInvoiceItem() {
    invoiceItems.add(InvoiceItem());
    state = free;
  }

  void onRemoveInvoiceItem(int index) {
    invoiceItems.removeAt(index);
    state = free;
  }

  final List<ProductModel> _products = [];
  List<ProductModel> get products => _products;

  final List<CashPartyModel> _cashParties = [];
  List<CashPartyModel> get cashParties => _cashParties;

  final List<LedgerAccountModel> _ledgerAccounts = [];
  List<LedgerAccountModel> get ledgerAccounts => _ledgerAccounts;

  final List<SeriesModel> _serieses = [];
  List<SeriesModel> get serieses => _serieses;

  final List<ProjectModel> _projects = [];
  List<ProjectModel> get projects => _projects;

  final List<DepotLocationModel> _depotLocations = [];
  List<DepotLocationModel> get depotLocations => _depotLocations;

  final List<TaxModel> _taxes = [];
  List<TaxModel> get taxes => _taxes;

  Future<void> init(WriteInvoiceArguments arguments) async {
    state = busy;
    try {
      _type = arguments.invoiceType;

      if (_type == InvoiceType.sales) {
        if (arguments.invoice != null) {
          _sales = arguments.invoice;
          _viewTitle = '(${_sales.voucherNo}) Edit Sales Invoice';
          _isEdit = true;
        } else {
          _viewTitle = 'New Sales Invoice';
        }
        _accountType = 'Sales';
      } else {
        if (arguments.invoice != null) {
          _purchase = arguments.invoice;
          _viewTitle = '(${_purchase.voucherNo}) Edit Purchase Invoice';
          _isEdit = true;
        } else {
          _viewTitle = 'New Purchase Invoice';
        }
        _accountType = 'Purchase';
      }

      _cashParties.addAll(await _invoiceService.getAllCashParties());
      _ledgerAccounts.addAll(
        await _invoiceService.getAllLedgerAccounts(
          GetAllLedgerAccountsDTO(_type),
        ),
      );
      _products.addAll(await _invoiceService.getAllProducts());
      _taxes.addAll(await _invoiceService.getAllTaxes());
      _projects.addAll(await _invoiceService.getAllProjects());
      _serieses.addAll(
        await _invoiceService.getAllSeries(
          GetAllSeriesDTO(_type),
        ),
      );
      _depotLocations.addAll(await _invoiceService.getAllDepot());

      if (_type == InvoiceType.sales) {
        if (arguments.invoice != null) {
          voucherNumber = _sales.voucherNo;
          invoiceDate = _sales.createdDate;
          cashPartyAccount = _cashParties.firstWhere(
            (element) => element.ledgerId == _sales.cashPartyLedgerID,
          );
          invoiceAccount = _ledgerAccounts.firstWhere(
            (element) => element.ledgerId == _sales.salesLedgerID,
          );
          series = _serieses.firstWhere(
            (element) => element.id == _sales.seriesID,
          );
          depotLocation = _depotLocations.firstWhere(
            (element) => element.id == _sales.depotID,
          );
          project = _projects.firstWhere(
            (element) => element.id == _sales.projectID,
          );

          for (var _detail in _sales.invoiceDetails) {
            final _inv = InvoiceItem();
            _inv.product = _products.firstWhere(
              (p) => p.productId == _detail.productID,
            );
            _inv.quantity = _detail.quantity;
            _inv.discount = _detail.discountAmount;
            _inv.rate = _detail.salesRate;
            _inv.remarks = _detail.remarks;
            _inv.tax = _taxes.firstWhere((t) => t.id == _detail.taxID);
            invoiceItems.add(_inv);
          }
        }
      } else {
        if (arguments.invoice != null) {
          voucherNumber = _purchase.voucherNo;
          invoiceDate = _purchase.createdDate;
          cashPartyAccount = _cashParties.firstWhere(
            (element) => element.ledgerId == _purchase.cashPartyLedgerID,
          );
          invoiceAccount = _ledgerAccounts.firstWhere(
            (element) => element.ledgerId == _purchase.purchaseLedgerID,
          );
          series = _serieses.firstWhere(
            (element) => element.id == _purchase.seriesID,
          );
          depotLocation = _depotLocations.firstWhere(
            (element) => element.id == _purchase.depotID,
          );
          project = _projects.firstWhere(
            (element) => element.id == _purchase.projectID,
          );

          if (_purchase.purchaseInvoiceDetails != null) {
            for (var _detail in _purchase.purchaseInvoiceDetails!) {
              final _inv = InvoiceItem();
              _inv.product = _products.firstWhere(
                (p) => p.productId == _detail.productID,
              );
              _inv.quantity = _detail.quantity;
              _inv.discount = _detail.discountAmount;
              _inv.rate = _detail.purchaseRate;
              _inv.remarks = _detail.remarks;
              _inv.tax = _taxes.firstWhere((t) => t.id == _detail.taxID);
              invoiceItems.add(_inv);
            }
          }
        }
      }
    } catch (e) {
      if (e is DioError) {
        showApiError(e);
      } else {
        Fluttertoast.showToast(
          msg: 'Something unexpected occured.',
          toastLength: Toast.LENGTH_LONG,
        );
      }
      goBack();
    }

    state = free;
  }

  Future<void> onSeriesChanged(SeriesModel series) async {
    if (series == this.series) {
      return;
    }
    this.series = series;
    state = free;
    try {
      final _seriesVoucherType = await _invoiceService.getSeriesVoucher(
        GetSeriesVoucherDTO(series.id),
      );

      voucherNumber = _seriesVoucherType.voucherNo;
      voucherNumberType = _seriesVoucherType.type;
      state = free;
    } catch (e) {
      if (e is DioError) {
        showApiError(e);
      } else {
        Fluttertoast.showToast(
          msg: 'Something unexpected occured.',
          toastLength: Toast.LENGTH_LONG,
        );
      }
    }
  }

  Future<void> onSavePressed() async {
    try {
      state = busy;

      if (_type == InvoiceType.sales) {
        if (_isEdit) {
          // TODO:: Edit sales
        } else {
          final _dto = _prepareAddSalesDto();

          await _saleService.addSales(_dto);
        }
      } else {
        if (_isEdit) {
          // TODO:: Edit purchase
        } else {
          // TODO:: Create purchase
        }
      }
      state = free;

      goBack();
    } catch (e) {
      state = free;

      if (e is DioError) {
        showApiError(e);
      } else {
        Fluttertoast.showToast(
          msg: 'Something unexpected occured.',
          toastLength: Toast.LENGTH_LONG,
        );
      }
    }
  }

  AddSalesDTO _prepareAddSalesDto() {
    final _total = invoiceItems.fold<double>(0, (a, b) {
      return a + (b.quantity ?? 0) * (b.rate ?? 0);
    });

    final _totalDiscount = invoiceItems.fold<double>(0, (a, b) {
      return a + (b.discount ?? 0);
    });

    final _totalTax = invoiceItems.fold<double>(0, (a, b) {
      final _total = (b.quantity ?? 0) * (b.rate ?? 0);
      final _discount = (b.discount ?? 0);
      final _net = _total - _discount;
      double _tax =
          b.tax == null || b.tax!.rate == 0 ? 0 : _net / 100 * b.tax!.rate;

      return a + _tax;
    });

    final _totalQuantity = invoiceItems.fold<double>(0, (a, b) {
      return a + (b.quantity ?? 0);
    });

    return AddSalesDTO(
      netAmount: _total - _totalDiscount + _totalTax,
      totalAmount: _total,
      totalQuantity: _totalQuantity,
      totalDiscount: _totalDiscount,
      totalTax: _totalTax,
      cashPartyLedgerID: cashPartyAccount!.ledgerId,
      date: invoiceDate!,
      depotID: depotLocation!.id,
      invoiceDetails: invoiceItems
          .map(
            (invoiceItem) => <String, dynamic>{
              'Amount': (invoiceItem.quantity ?? 0) * (invoiceItem.rate ?? 0),
              'CodeName': invoiceItem.product!.codeName,
              'DiscPercentage': ((invoiceItem.discount ?? 0) /
                      (((invoiceItem.quantity ?? 0) *
                          (invoiceItem.rate ?? 0)))) *
                  100,
              'DiscountAmount': invoiceItem.discount,
              'ID': 0,
              'NetAmount':
                  ((invoiceItem.quantity ?? 0) * (invoiceItem.rate ?? 0)) -
                      invoiceItem.discount!,
              'ProductCode': invoiceItem.product!.productCode,
              'ProductID': invoiceItem.product!.productId,
              'ProductName': invoiceItem.product!.productName,
              'QtyUnitID': invoiceItem.product!.qtyUnitId,
              'QtyUnitName': invoiceItem.product!.qtyUnitName,
              'Quantity': invoiceItem.quantity,
              'Remarks': '',
              'SalesRate': invoiceItem.rate,
              'TaxAmount':
                  (((invoiceItem.quantity ?? 0) * (invoiceItem.rate ?? 0)) -
                          invoiceItem.discount!) /
                      100 *
                      invoiceItem.tax!.rate,
              'TaxID': invoiceItem.tax!.id,
            },
          )
          .toList(),
      projectId: project!.id,
      salesLedgerID: invoiceAccount!.ledgerId,
      seriesId: series!.id,
      vat: 0,
      voucherNo: voucherNumber!,
    );
  }
}
