import 'package:accswift/core/locator.dart';
import 'package:accswift/helpers/ui_helpers.dart';
import 'package:accswift/services/navigator_service.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:accswift/models/general_summary_model.dart';

class SummaryCard extends StatelessWidget {
  final GeneralSummary summary;
  final String? intentTo;

  const SummaryCard(this.summary, {Key? key, this.intentTo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.grey.shade200,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Ionicons.analytics_outline,
            size: 32,
          ),
          UISpace.spaceVrSm,
          Text(
            '${summary.title}${summary.noOfVouchers != null ? ' (${summary.noOfVouchers})' : ''}',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          UISpace.spaceVrSm,
          Text(
            summary.balance != null
                ? summary.balance!
                : '${summary.amountThisMonth}/${summary.amountThisYear}',
            style: Theme.of(context).textTheme.overline,
          ),
          if (intentTo != null) UISpace.spaceVrSm,
          if (intentTo != null)
            IconButton(
              onPressed: () {
                locator<NavigatorService>().navigateTo(intentTo!);
              },
              icon: const Icon(Ionicons.arrow_forward_outline),
              visualDensity: VisualDensity.compact,
              color: Theme.of(context).colorScheme.secondary,
            ),
        ],
      ),
    );
  }
}
