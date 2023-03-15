import 'package:accswift/core/base/base_view.dart';
import 'package:accswift/helpers/ui_helpers.dart';
import 'package:accswift/views/dashboard/dashboard_viewmodel.dart';
import 'package:accswift/views/dashboard/fragments/invoice/invoice_view.dart';
import 'package:accswift/views/dashboard/fragments/invoice/more/more_view.dart';
import 'package:accswift/views/dashboard/fragments/stats/stats_view.dart';
import 'package:accswift/views/dashboard/fragments/transactions/transactions_view.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  static String tag = 'dashboard';

  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _views = [
      const StatsView(),
      const InvoiceView(),
      const TransactionsView(),
      const MoreView()
    ];

    return BaseView<DashboardViewModel>(
      builder: (ctx, model, child) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: model.screenIndex,
            type: BottomNavigationBarType.fixed,
            onTap: (idx) => model.screenIndex = idx,
            unselectedItemColor: Theme.of(context).disabledColor,
            items: bnvItems
                .map(
                  (bnv) => BottomNavigationBarItem(
                    icon: Icon(bnv.icon),
                    activeIcon: Icon(bnv.activeIcon),
                    label: bnv.title,
                  ),
                )
                .toList(),
          ),
          body: _views[model.screenIndex],
        );
      },
    );
  }
}
