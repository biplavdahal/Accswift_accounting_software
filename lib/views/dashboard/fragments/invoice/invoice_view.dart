import 'package:accswift/core/base/base_view.dart';
import 'package:accswift/views/dashboard/fragments/invoice/invoice_viewmodel.dart';
import 'package:accswift/views/purchase/purchase_view.dart';
import 'package:accswift/views/sales/sales_view.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class InvoiceView extends StatelessWidget {
  const InvoiceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<InvoiceViewModel>(
      killViewOnClose: false,
      builder: (ctx, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Invoices'),
          ),
          body: ListView(
            children: [
              ListTile(
                leading: const Icon(Ionicons.receipt_outline),
                title: const Text('Sales'),
                onTap: () {
                  model.goto(SalesView.tag);
                },
              ),
              ListTile(
                leading: const Icon(Ionicons.receipt_outline),
                title: const Text('Purchase'),
                onTap: () {
                  model.goto(PurchaseView.tag);
                },
              ),
              const  ListTile(
                leading:  Icon(Ionicons.receipt_outline),
                title:  Text('Journal'),
                // onTap: () => Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (BuildContext context) => const JournalView()),
                // ),
              ),
            ],
          ),
        );
      },
    );
  }
}
