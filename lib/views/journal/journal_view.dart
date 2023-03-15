// import 'package:accswift/core/base/base_view.dart';
// import 'package:accswift/views/journal/journal_viewmodel.dart';
// import 'package:accswift/views/journal/widget/journal_item.dart';
// import 'package:accswift/views/write_invoice/write_invoice_arguments.dart';
// import 'package:accswift/views/write_invoice/write_invoice_view.dart';
// import 'package:flutter/material.dart';
// import 'package:ionicons/ionicons.dart';

// class JournalView extends StatelessWidget {
//   static String tag = 'Journal-view';

//   const JournalView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final ScrollController _scrollController = ScrollController();

//     return BaseView<JournalViewModel>(
//       onDispose: (model) {
//         _scrollController.dispose();
//       },
//       onModelReady: (model) async {
//         await model.init();
//         _scrollController.addListener(() {
//           if (_scrollController.position.pixels ==
//               _scrollController.position.maxScrollExtent) {
//             model.loadMore();
//           }
//         });
//       },
//       initState: (model) {
//         _scrollController.addListener(() {
//           if (_scrollController.position.maxScrollExtent ==
//               _scrollController.offset) {
//             model.loadMore();
//           }
//         });
//       },
//       killViewOnClose: false,
//       builder: (ctx, model, child) {
//         return Scaffold(
//           appBar: AppBar(
//             title: const Text('Journal'),
//             actions: [
//               TextButton.icon(
//                 style: TextButton.styleFrom(
//                   primary: Colors.white,
//                 ),
//                 onPressed: () async {
//                   await model.goto(
//                     WriteInvoiceView.tag,
//                     arguments: WriteInvoiceArguments(InvoiceType.journal),
//                   );
//                   model.state = model.free;
//                 },
//                 icon: const Icon(Ionicons.add),
//                 label: const Text('Invoice'),
//               ),
//             ],
//           ),
//           body: model.isLoading
//               ? const Center(
//                   child: CircularProgressIndicator(
//                     backgroundColor: Color(0xFFf4f590),
//                   ),
//                 )
//               : Stack(
//                   children: [
//                     ListView.separated(
//                       controller: _scrollController,
//                       separatorBuilder: (context, index) => const SizedBox(
//                         height: 10,
//                       ),
//                       itemBuilder: (context, index) {
//                         final _journal = model.journal[index];

//                         return AnimatedOpacity(
//                           opacity: model.isBusyWidget('delete-${_journal.id}')
//                               ? 0.4
//                               : 1,
//                           duration: const Duration(milliseconds: 300),
//                           child: JournalItem(
//                             journal: _journal,
//                             onEdit: () async {
//                               await model.goto(
//                                 WriteInvoiceView.tag,
//                                 arguments: WriteInvoiceArguments(
//                                   InvoiceType.journal,
//                                   invoice: _journal,
//                                 ),
//                               );
//                               model.state = model.free;
//                             },
//                           ),
//                         );
//                       },
//                       itemCount: model.journal.length,
//                     ),
//                     Positioned(
//                       bottom: 0,
//                       left: 0,
//                       right: 0,
//                       child: AnimatedContainer(
//                         padding: EdgeInsets.all(
//                             model.isBusyWidget('load-more') ? 16 : 0),
//                         color: Colors.orange,
//                         duration: const Duration(milliseconds: 100),
//                         child: model.isBusyWidget('load-more')
//                             ? const Text(
//                                 'Loading More...',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                 ),
//                               )
//                             : Container(),
//                       ),
//                     )
//                   ],
//                 ),
//         );
//       },
//     );
//   }
// }
