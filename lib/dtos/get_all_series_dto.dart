import 'package:accswift/views/write_invoice/write_invoice_arguments.dart';

class GetAllSeriesDTO {
  String get endpoint => 'Series';

  final InvoiceType type;

  GetAllSeriesDTO(this.type);

  Map<String, dynamic> make() {
    return {
      'VoucherType': type == InvoiceType.purchase ? 'PURCH' : 'SALES',
    };
  }
}
