import 'package:accswift/core/base/base_view.dart';
import 'package:accswift/core/locator.dart';
import 'package:accswift/helpers/ui_helpers.dart';
import 'package:accswift/services/user_service.dart';
import 'package:accswift/views/dashboard/fragments/stats/stats_viewmodel.dart';
import 'package:accswift/widgets/bill_reminder.dart';
import 'package:accswift/widgets/summary_card.dart';
import 'package:flutter/material.dart';
import 'package:accswift/models/general_summary_model.dart';

class StatsView extends StatelessWidget {
  const StatsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _user = locator<UserService>().currentUser;

    return BaseView<StatsViewModel>(
      killViewOnClose: false,
      onModelReady: (model) => model.init(),
      builder: (ctx, model, child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  child: Text(
                    _user!.name[0],
                  ),
                ),
                UISpace.spaceHrSm,
                Text('Welcome ${_user.address}')
              ],
            ),
          ),
          body: model.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Color(0xFFf4f590),
                  ),
                )
              : RefreshIndicator(
                  onRefresh: model.init,
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: UIPadding.large,
                    child: Column(
                      children: [
                        _buildSummaries(model.generalSummaries),
                        UISpace.spaceVrMd,
                        const BillReminder(),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }

  Widget _buildSummaries(List<GeneralSummary> summaries) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: UISpace.spaceVrSm.height!,
      crossAxisSpacing: UISpace.spaceHrSm.width!,
      shrinkWrap: true,
      crossAxisCount: 2,
      children: summaries.map(
        (summary) {
          final _intentable = ['Sales', 'Purchase'];

          return SummaryCard(
            summary,
            intentTo: _intentable.contains(summary.title)
                ? '${summary.title?.toLowerCase()}-view'
                : null,
          );
        },
      ).toList(),
    );
  }
}
