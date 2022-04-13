import 'package:flutter/material.dart';

class GroupsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GroupsAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      backgroundColor: Colors.white,
      bottom: const TabBar(
        isScrollable: true,
        labelColor: Colors.black,
        tabs: [
          Tab(text: 'My Groups'),
          Tab(text: 'Top Groups'),
          Tab(text: 'Teams'),
          Tab(text: 'Clubs'),
          Tab(text: 'Classes'),
        ],
      ),
    );
  }
}
