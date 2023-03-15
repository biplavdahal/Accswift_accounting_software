import 'package:accswift/core/base/base_view.dart';
import 'package:accswift/helpers/ui_helpers.dart';
import 'package:accswift/views/reset_password/reset_password_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class ResetPasswordView extends StatelessWidget {
  static String tag = 'reset-password';

  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // UI Controllers
    final _emailController = TextEditingController();

    return BaseView<ResetPasswordViewModel>(
      onModelReady: (model) {
        _emailController.addListener(() {
          model.email = _emailController.text;
        });
      },
      enableTouchRepeal: true,
      builder: (ctx, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Reset Password'),
          ),
          body: SingleChildScrollView(
            padding: UIPadding.medium,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UISpace.spaceVrMd,
                Text(
                  'Reset code will be sent to your email',
                  style: Theme.of(context).textTheme.headline6,
                ),
                UISpace.spaceVrLg,
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Enter email',
                    icon: Icon(Ionicons.mail_outline),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                UISpace.spaceVrMd,
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('RESET PASSWORD'),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
