import 'package:accswift/core/base/base_view_arguments.dart';
import 'package:accswift/views/dashboard/dashboard_view.dart';
import 'package:accswift/views/dashboard/fragments/transactions/reports/ledger/ledger_view.dart';
import 'package:accswift/views/journal/journal_view.dart';
import 'package:accswift/views/login/login_view.dart';
import 'package:accswift/views/purchase/purchase_view.dart';
import 'package:accswift/views/reset_password/reset_password_view.dart';
import 'package:accswift/views/sales/sales_view.dart';
import 'package:accswift/views/write_invoice/write_invoice_view.dart';
import 'package:flutter/material.dart';

Map<String, Widget> routesAndViews(RouteSettings settings) => {
      LoginView.tag: const LoginView(),
      ResetPasswordView.tag: const ResetPasswordView(),
      DashboardView.tag: const DashboardView(),
      SalesView.tag: const SalesView(),
      LedgerView.tag: const LedgerView(),
      PurchaseView.tag: const PurchaseView(),
      WriteInvoiceView.tag:
          WriteInvoiceView(settings.arguments as BaseViewArguments?),
    };
