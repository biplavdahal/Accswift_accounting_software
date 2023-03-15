import 'package:accswift/core/base/base_view.dart';
import 'package:accswift/views/dashboard/fragments/invoice/more/more_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class MoreView extends StatelessWidget {
  const MoreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<MoreViewModel>(
      killViewOnClose: false,
      builder: (ctx, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('More'),
          ),
          body: ListView(
            children: [
              ListTile(
                leading: const Icon(Ionicons.lock_closed_outline),
                title: const Text('Security'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Ionicons.settings_outline),
                title: const Text('Settings'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(
                  Ionicons.log_out_outline,
                  color: Theme.of(context).errorColor,
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(
                    color: Theme.of(context).errorColor,
                  ),
                ),
                onTap: () {
                  model.onLogoutPressed();
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Ionicons.phone_portrait_outline),
                title: const Text('About AccSwift™ Mobile'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Ionicons.information_circle_outline),
                title: const Text('Terms and Conditions'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Ionicons.information_circle_outline),
                title: const Text('Privacy Policy'),
                onTap: () {},
              ),
            ],
          ),
        );
      },
    );
  }
}
