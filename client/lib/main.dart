import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/theme/theme.dart';
import 'data/providers/api_provider.dart';
import 'modules/account/account_model.dart';
import 'modules/account/account_vm.dart';
import 'modules/account/account_repository.dart';
import 'modules/account/account_service.dart';
import 'routes/routes.dart';

void main() {
  runApp(const Educave());
}

class Educave extends StatelessWidget {
  const Educave({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AccountViewModel>(
          create: (_) => AccountViewModel(
            AccountService(
                AccountRepository(
                  ApiProvider(),
                ),
                AccountModel(
                    id: '2',
                    email: 'christian@uwaterloo.ca',
                    profilePic:
                        'https://media-exp1.licdn.com/dms/image/C5603AQHLtS1MARQqOg/profile-displayphoto-shrink_400_400/0/1653073727247?e=1658361600&v=beta&t=NWLMe2E2VwZnFpVktFFlRbQeWS1AAyrAiZoPoPlnt8s')),
          ),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeData,
        routes: appRoutes,
        initialRoute: AppRouteNames.onBoard,
      ),
    );
  }
}
