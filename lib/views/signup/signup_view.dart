import 'package:accswift/helpers/form_validator_helpers.dart';
import 'package:accswift/helpers/ui_helpers.dart';
import 'package:accswift/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Logo(
          size: 30,
        ),
      ),
      body: Form(
        child: SingleChildScrollView(
          padding: UIPadding.medium,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UISpace.spaceVrMd,
              Text(
                'Donot have account? SignUp',
                style: Theme.of(context).textTheme.headline6,
              ),
              UISpace.spaceVrLg,
              TextFormField(
                validator: (value) => FormValidator.isRequired(
                  value,
                  fieldName: 'Username',
                ),
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  icon: Icon(Ionicons.person_outline),
                ),
              ),
              UISpace.spaceVrMd,
              TextFormField(
                validator: (value) => FormValidator.isRequired(
                  value,
                  fieldName: 'mobilenumber',
                ),
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  icon: Icon(Ionicons.phone_portrait_sharp),
                ),
              ),
              UISpace.spaceVrMd,
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Email adresses';
                  } else if (!RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value)) {
                    return 'Please enter your email adresses correctly';
                  }
                },
                decoration: const InputDecoration(
                  labelText: 'Email Adresses',
                  icon: Icon(Ionicons.mail_open_outline),
                ),
              ),
              UISpace.spaceVrMd,
              TextFormField(
                validator: (value) => FormValidator.isRequired(
                  value,
                  fieldName: 'Password',
                ),
                decoration: const InputDecoration(
                  labelText: 'New password',
                  icon: Icon(Ionicons.lock_closed_outline),
                ),
                obscureText: true,
              ),
              UISpace.spaceVrMd,
              TextFormField(
                validator: (value) => FormValidator.isRequired(
                  value,
                  fieldName: 'Password',
                ),
                decoration: const InputDecoration(
                  labelText: 'Re-enter password',
                  icon: Icon(Ionicons.lock_closed_outline),
                ),
                obscureText: true,
              ),
              UISpace.spaceVrSm,
              UISpace.spaceVrSm,
              UISpace.spaceVrSm,
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    
                  },
                  child: const Text('SUBMIT'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
