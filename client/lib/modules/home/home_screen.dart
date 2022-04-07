import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../post/post_controller.dart';
import '../post/post_model.dart';
import '../post/post_widget.dart';
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

    return FutureBuilder<List<PostModel>>(
      future: controller.posts(),
      builder: (BuildContext context, AsyncSnapshot<List<PostModel>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return ChangeNotifierProvider(
                create: (context) => PostController(snapshot.data![index]),
                child: const Post(),
              );
            },
          );
        } else {
          return const Text('Loading');
        }
      },
    );
  }
}
