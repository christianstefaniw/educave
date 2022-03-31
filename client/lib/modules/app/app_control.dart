import 'package:flutter/material.dart';

import '../calendar/calendar_page.dart';
import '../groups/groups_page.dart';
import '../home/home_screen.dart';
import '../profile/profile_page.dart';

class AppControl extends StatefulWidget {
  const AppControl({Key? key}) : super(key: key);

  @override
  State<AppControl> createState() => _AppControlState();
}

class _AppControlState extends State<AppControl> {
  final PageController _myPage = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 50,
          child: Row(
            children: <Widget>[
              Expanded(
                child: IconButton(
                  iconSize: 34,
                  icon: Icon(
                      _myPage.page == 0 ? Icons.home : Icons.home_outlined),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    setState(() {
                      _myPage.jumpToPage(0);
                    });
                  },
                ),
              ),
              Expanded(
                child: IconButton(
                  iconSize: 35,
                  icon: Icon(
                      _myPage.page == 1 ? Icons.people : Icons.people_outline),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    setState(() {
                      _myPage.jumpToPage(1);
                    });
                  },
                ),
              ),
              Expanded(
                child: IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    iconSize: 0,
                    icon: const Icon(null),
                    onPressed: () {}),
              ),
              Expanded(
                child: IconButton(
                  iconSize: 27,
                  icon: Icon(_myPage.page == 2
                      ? Icons.calendar_today
                      : Icons.calendar_today_outlined),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    setState(() {
                      _myPage.jumpToPage(2);
                    });
                  },
                ),
              ),
              Expanded(
                child: IconButton(
                  iconSize: 28,
                  icon: Icon(
                      _myPage.page == 3 ? Icons.circle : Icons.circle_outlined),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    setState(() {
                      _myPage.jumpToPage(3);
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
      body: PageView(
        controller: _myPage,
        children: const <Widget>[
          Home(),
          Groups(),
          Calendar(),
          Profile(),
        ],
        physics: const NeverScrollableScrollPhysics(),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 22),
        child: FloatingActionButton(
          elevation: 0,
          backgroundColor: Theme.of(context).colorScheme.primary,
          splashColor: Colors.transparent,
          highlightElevation: 3,
          onPressed: () {},
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 33,
          ),
        ),
      ),
    );
  }
}
