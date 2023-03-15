import 'package:accswift/core/base/base_view.dart';
import 'package:accswift/views/dashboard/fragments/transactions/reports/ledger/widgets/ledger_item.dart';
import 'package:flutter/material.dart';
import 'package:accswift/views/dashboard/fragments/transactions/reports/ledger/ledger_view_model.dart';
import 'package:ionicons/ionicons.dart';

class LedgerView extends StatelessWidget {
  static String tag = 'ledger-view';

  const LedgerView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();

    return BaseView<LedgerViewModel>(
      onDispose: (model) {
        _scrollController.dispose();
      },
      onModelReady: (model) async {
        await model.init();
        _scrollController.addListener(() {
          if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent) {
            model.loadMore();
          }
        });
      },
      initState: (model) {
        _scrollController.addListener(() {
          if (_scrollController.position.maxScrollExtent ==
              _scrollController.offset) {
            model.loadMore();
          }
        });
      },
      killViewOnClose: false,
      builder: (ctx, model, child) {
        return Scaffold(
            appBar: AppBar(
              title: const Text('Ledger'),
            ),
            body: model.isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Color(0xFFf4f590),
                    ),
                  )
                : Stack(
                    children: [
                      ListView.separated(
                        controller: _scrollController,
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                        itemBuilder: (context, index) {
                          final _ledger = model.ledger[index];

                          return AnimatedOpacity(
                            opacity:
                                model.isBusyWidget('delete-${_ledger.groupId}')
                                    ? 0.4
                                    : 1,
                            duration: const Duration(microseconds: 300),
                            child: LedgerItem(
                              ledger: _ledger,
                            ),
                          );
                        },
                        itemCount: model.ledger.length,
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: AnimatedContainer(
                          padding: EdgeInsets.all(
                              model.isBusyWidget('load-more') ? 16 : 0),
                          color: Colors.orange,
                          duration: const Duration(milliseconds: 100),
                          child: model.isBusyWidget('load-more')
                              ? const BottomAppBar(
                                  child: CircularProgressIndicator(
                                    backgroundColor: Color(0xFFf4f590),
                                  ),
                                )
                              : Container(),
                        ),
                      ),
                    ],
                  ));
      },
    );
  }
}
