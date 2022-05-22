import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/safearea.dart';
import '../account/account_model.dart';
import '../account/account_provider.dart';
import '../app/app_control.dart';

class OnBoardControl extends StatelessWidget {
  const OnBoardControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<AccountProvider>(context, listen: false).setAccount(
      AccountModel(
        id: '2',
        email: 'christian@uwaterloo.ca',
        firstName: 'Christian',
        lastName: 'Stefaniw',
        profilePic:
            'https://media-exp1.licdn.com/dms/image/C5603AQHLtS1MARQqOg/profile-displayphoto-shrink_400_400/0/1653073727247?e=1658361600&v=beta&t=NWLMe2E2VwZnFpVktFFlRbQeWS1AAyrAiZoPoPlnt8s',
      ),
    );
    /*return ChangeNotifierProvider(
      create: (_) => LoginViewModel(),
      child: const Login(),
    );
    */
    return const MySafeArea(
      child: AppControl(),
    );
  }
}
