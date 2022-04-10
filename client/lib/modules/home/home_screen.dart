import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../post/posts_widget.dart';
import 'home_controller.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final controller = Provider.of<HomeController>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder<List<dynamic>>(
              future: Future.wait([controller.posts(), controller.stories()]),
              builder: (BuildContext context,
                  AsyncSnapshot<List<dynamic>> snapshot) {
                if (snapshot.hasData) {
                  return Posts(
                    snapshot.data![0],
                    stories: snapshot.data![1],
                  );
                } else {
                  return const Text('loading');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
