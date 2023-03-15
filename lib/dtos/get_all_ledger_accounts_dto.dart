import 'package:accswift/views/write_invoice/write_invoice_arguments.dart';

class GetAllLedgerAccountsDTO {
  final InvoiceType type;

  String get endpoint => type == InvoiceType.sales
      ? 'Ledger/salesAccounts'
      : 'Ledger/purchAccounts';

  GetAllLedgerAccountsDTO(this.type);
}
