import 'package:accswift/core/base/base_view.dart';
import 'package:accswift/helpers/ui_helpers.dart';
import 'package:accswift/views/start_up/start_up_viewmodel.dart';
import 'package:accswift/widgets/logo.dart';
import 'package:flutter/material.dart';

class StartUpView extends StatelessWidget {
  const StartUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<StartUpViewModel>(
      onModelReady: (model) => model.init(),
      builder: (context, model, _) => Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Logo(
                size: 35,
              ),
              UISpace.spaceVrSm,
              CircularProgressIndicator(
                backgroundColor: Color(0xFFf4f590),
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
