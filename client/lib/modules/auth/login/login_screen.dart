import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../routes/routes.dart';
import '../../../widgets/cta_button.dart';
import '../../../widgets/error_text.dart';
import '../../account/account_controller.dart';
import '../widgets/auth_text_input.dart';
import 'login_controller.dart';

/// So, I did not use the `TextFormField` built in validation feature and here's why.
/// This widget is now unaware if the errors came from the server or the client.
/// It just knows that it came from our controller, which is all it needs to know.
/// This makes our controller the single source of truth for errors

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<LoginController>(context);
    final accountController = Provider.of<AccountController>(context);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.only(
          left: 15,
          right: 15,
          top: MediaQuery.of(context).size.width * 0.3,
        ),
        child: Column(
          children: <Widget>[
            Text(
              'Educave',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(
              height: 60,
            ),
            Form(
              child: Column(
                children: <Widget>[
                  AuthTextInput(
                    controller: controller.emailController,
                    hintText: 'Email',
                    errorText: controller.validationErrors['email'],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  AuthTextInput(
                    controller: controller.passwordController,
                    hintText: 'Password',
                    errorText: controller.validationErrors['password'],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CtaButton(
                    onPressed: () async {
                      final account = await controller.login();
                      if (account == null) return;
                      accountController.setAccount(account);
                      Navigator.pushReplacementNamed(
                          context, AppRouteNames.home);
                    },
                    text: 'Login',
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    width: double.infinity,
                  ),
                  ErrorText(text: controller.validationErrors['error'])
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
