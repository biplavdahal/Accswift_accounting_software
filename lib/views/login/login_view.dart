import 'package:accswift/core/base/base_view.dart';
import 'package:accswift/helpers/form_validator_helpers.dart';
import 'package:accswift/helpers/ui_helpers.dart';
import 'package:accswift/views/login/login_viewmodel.dart';
import 'package:accswift/views/signup/signup_view.dart';
import 'package:accswift/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class LoginView extends StatelessWidget {
  static String tag = 'login';

  const LoginView({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    // UI Keys & Controllers
    final _loginFormKey = GlobalKey<FormState>();
    final _usernameController = TextEditingController();
    final _passwordController = TextEditingController();

    return BaseView<LoginViewModel>(
      onModelReady: (model) {
        _usernameController.addListener(() {
          model.username = _usernameController.text;
        });

        _passwordController.addListener(() {
          model.password = _passwordController.text;
        });
      },
      enableTouchRepeal: true,
      builder: (ctx, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Logo(
              size: 30,
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(5),
              child: model.isLoading
                  ? const LinearProgressIndicator()
                  : Container(),
            ),
          ),
          body: Form(
            key: _loginFormKey,
            child: SingleChildScrollView(
              padding: UIPadding.medium,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UISpace.spaceVrMd,
                  Text(
                    'Login with your account',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  UISpace.spaceVrLg,
                  TextFormField(
                    controller: _usernameController,
                    enabled: !model.isLoading,
                    validator: (value) => FormValidator.isRequired(
                      value,
                      fieldName: 'Username',
                    ),
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      icon: Icon(Ionicons.person_outline),
                    ),
                  ),
                  UISpace.spaceVrMd,
                  TextFormField(
                    controller: _passwordController,
                    enabled: !model.isLoading,
                    validator: (value) => FormValidator.isRequired(
                      value,
                      fieldName: 'Password',
                    ),
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      icon: Icon(Ionicons.lock_closed_outline),
                    ),
                    obscureText: true,
                  ),
                  UISpace.spaceVrSm,
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: model.isLoading
                          ? null
                          : model.onForgotPasswordPressed,
                      child: const Text('Forgot password?'),
                    ),
                  ),
                  UISpace.spaceVrSm,
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: model.isLoading
                          ? null
                          : () {
                              if (_loginFormKey.currentState!.validate()) {
                                model.onLoginPressed();
                              }
                            },
                      child: const Text('LOGIN'),
                    ),
                  ),
                  UISpace.spaceVrSm,
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                   const  Signup()));

                      },
                      child: const Text('SIGNUP'),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
