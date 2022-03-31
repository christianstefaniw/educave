import 'package:client/routes/routes.dart';
import 'package:flutter/material.dart';

class ScaffoldWithNav extends StatelessWidget {
  final String? location;
  final Widget body;

  const ScaffoldWithNav({required this.location, required this.body, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const iconColor = Colors.black;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 13.0),
        child: FloatingActionButton(
          elevation: 1,
          backgroundColor: Theme.of(context).colorScheme.primary,
          onPressed: () => Navigator.of(context).pop(),
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 32,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: SizedBox(
          height: 35,
          child: Row(
            children: <Widget>[
              Expanded(
                child: IconButton(
                  splashColor: Colors.transparent,
                  icon: Image.asset(
                    'assets/icons/bottom_nav/home.png',
                  ),
                  onPressed: () {},
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: Icon(
                    location == AppRouteNames.groups
                        ? Icons.people
                        : Icons.people_outline,
                    size: 35,
                    color: iconColor,
                  ),
                  onPressed: () {},
                ),
              ),
              const Expanded(
                child: Icon(null),
              ),
              Expanded(
                child: IconButton(
                  icon: Icon(
                    location == AppRouteNames.calendar
                        ? Icons.calendar_today
                        : Icons.calendar_today_outlined,
                    size: 29,
                    color: iconColor,
                  ),
                  onPressed: () {},
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: Icon(
                    location == AppRouteNames.profile
                        ? Icons.circle
                        : Icons.circle_outlined,
                    size: 33,
                    color: iconColor,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
