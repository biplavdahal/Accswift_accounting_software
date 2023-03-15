class AddSalesDTO {
  String get endpoint => 'SalesInvoiceMaster';

  final double netAmount;
  final double totalAmount;
  final double totalQuantity;
  final double totalDiscount;
  final double totalTax;
  final int cashPartyLedgerID;
  final String date;
  final int depotID;
  final int id = 0;
  final List<Map<String, dynamic>> invoiceDetails;
  final bool isPay = false;
  final String orderNo = '';
  final String remarks = '';
  final int projectId;
  final int salesLedgerID;
  final int seriesId;
  final String status = 'DRAFT';
  final double vat;
  final String voucherNo;

  AddSalesDTO({
    required this.netAmount,
    required this.totalAmount,
    required this.totalQuantity,
    required this.totalDiscount,
    required this.totalTax,
    required this.cashPartyLedgerID,
    required this.date,
    required this.depotID,
    required this.invoiceDetails,
    required this.projectId,
    required this.salesLedgerID,
    required this.seriesId,
    required this.vat,
    required this.voucherNo,
  });

  Map<String, dynamic> make() {
    return {
      'CashPartyLedgerID': cashPartyLedgerID,
      'Date': date,
      'DepotID': depotID,
      'ID': id,
      'InvoiceDetails': invoiceDetails,
      'IsPay': isPay,
      'NetAmount': netAmount,
      'OrderNo': orderNo,
      'ProjectID': projectId,
      'Remarks': remarks,
      'SalesLedgerID': salesLedgerID,
      'SeriesID': seriesId,
      'Status': status,
      'TotalAmount': totalAmount,
      'TotalQty': totalQuantity,
      'SpecialDiscount': totalDiscount,
      'TotalTCAmount': totalTax,
      'VAT': vat,
      'VoucherNo': voucherNo,
    };
  }
}
