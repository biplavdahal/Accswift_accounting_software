import 'package:accswift/core/base/base_view.dart';
import 'package:accswift/views/dashboard/fragments/transactions/reports/ledger/ledger_view.dart';
import 'package:accswift/views/dashboard/fragments/transactions/transactions_viewmodel.dart';
import 'package:accswift/views/purchase/purchase_view.dart';
import 'package:accswift/views/sales/sales_view.dart';
import 'package:flutter/material.dart';

class TransactionsView extends StatelessWidget {
  const TransactionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<TransactionViewModel>(
      killViewOnClose: false,
      builder: (ctx, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Reports'),
          ),
          body: ListView(
            children: [
              ListTile(
                leading: const Icon(Icons.insert_drive_file_rounded),
                title: const Text('Ledger'),
                onTap: () {
                  model.goto(LedgerView.tag);
                },
              ),
              ListTile(
                leading: const Icon(Icons.insert_drive_file_rounded),
                title: const Text('Sales '),
                onTap: () {
                  model.goto(SalesView.tag);
                },
              ),
              ListTile(
                leading: const Icon(Icons.insert_drive_file_rounded),
                title: const Text('Purchase '),
                onTap: () {
                  model.goto(PurchaseView.tag);
                },
              ),
              ListTile(
                leading: const Icon(Icons.insert_drive_file_rounded),
                title: const Text('Bikri khata'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.insert_drive_file_rounded),
                title: const Text('Materialized View'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.insert_drive_file_rounded),
                title: const Text('Debtors'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.insert_drive_file_rounded),
                title: const Text('Day Book'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.insert_drive_file_rounded),
                title: const Text('Stock Status'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.insert_drive_file_rounded),
                title: const Text('Trial Balance'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.insert_drive_file_rounded),
                title: const Text('Kharid Khata'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.insert_drive_file_rounded),
                title: const Text('Cash Flow Report'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.insert_drive_file_rounded),
                title: const Text('Profit Loss'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.insert_drive_file_rounded),
                title: const Text('Balance Sheet'),
                onTap: () {},
              )
            ],
          ),
        );
      },
    );
  }
}
