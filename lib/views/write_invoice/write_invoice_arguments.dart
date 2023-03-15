import 'package:accswift/core/base/base_view_arguments.dart';

enum InvoiceType { sales, purchase, journal }

class WriteInvoiceArguments<T> extends BaseViewArguments {
  final InvoiceType invoiceType;
  final T? invoice;

  WriteInvoiceArguments(
    this.invoiceType, {
    this.invoice,
  });
}
