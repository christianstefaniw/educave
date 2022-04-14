import 'package:flutter/material.dart';

import '../../../core/theme/colors.dart';

class GroupsAppBar extends StatefulWidget implements PreferredSizeWidget {
  const GroupsAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 45);

  @override
  State<GroupsAppBar> createState() => _GroupsAppBarState();
}

class _GroupsAppBarState extends State<GroupsAppBar> {
  final FocusNode textFocus = FocusNode();
  bool focused = false;

  @override
  void initState() {
    textFocus.addListener(handleFocus);
    super.initState();
  }

  void handleFocus() {
    if (textFocus.hasFocus) {
      setState(() {
        focused = true;
      });
    } else {
      setState(() {
        focused = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      flexibleSpace: Container(
        padding: const EdgeInsets.only(left: 12, top: 9, right: 12),
        child: SizedBox(
          height: 40,
          child: TextField(
            maxLines: 1,
            focusNode: textFocus,
            style: const TextStyle(fontSize: 15),
            decoration: InputDecoration(
              prefixIcon: focused
                  ? null
                  : const Icon(
                      Icons.search,
                      size: 22,
                    ),
              hintText: 'Search for a Group',
              border: InputBorder.none,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
              filled: true,
              fillColor: AppColors.light,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(13),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(13),
              ),
            ),
          ),
        ),
      ),
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
