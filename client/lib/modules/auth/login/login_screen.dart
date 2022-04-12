import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../routes/routes.dart';
import '../../../widgets/cta_button.dart';
import '../../../widgets/error_text.dart';
import '../../user/user_vm.dart';
import '../widgets/auth_text_input.dart';
import 'login_vm.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<LoginViewModel>(context);
    final userViewModel = Provider.of<UserViewModel>(context, listen: false);

    final emailController = TextEditingController();
    final passwordController = TextEditingController();

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
                    controller: emailController,
                    hintText: 'Email',
                    errorText: viewModel.validationErrors['email'],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  AuthTextInput(
                    controller: passwordController,
                    hintText: 'Password',
                    errorText: viewModel.validationErrors['password'],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CtaButton(
                    onPressed: () async {
                      final account = await viewModel.login(
                          emailController.text, passwordController.text);
                      if (account == null) return;
                      userViewModel.setAccount(account);
                      Navigator.pushReplacementNamed(
                          context, AppRouteNames.home);
                    },
                    text: 'Login',
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    width: double.infinity,
                  ),
                  ErrorText(text: viewModel.validationErrors['error'])
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
