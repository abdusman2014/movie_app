import 'package:flutter/material.dart';
import 'package:movie_app/Presentation/View/Screens/watch_screen.dart';

import '../../../app/Config/app_colors.dart';
import 'dashboard_screen.dart';
import 'mediaLibrary_screen.dart';
import 'more_screen.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});
  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int selectedIndex = 1;
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
     List<Widget> widgetOptions = <Widget>[
    const  DashBoardScreen(),
     const WatchScreen(),
     const MediaLibraryScreen(),
     const MoreScreen(),
    ];
    return Scaffold(
      body: widgetOptions.elementAt(selectedIndex),
      bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(27),
            topLeft: Radius.circular(27),
          ),
          child: Theme(
            data: ThemeData(
              splashColor: Colors.transparent,
            ),
            child: BottomNavBar(
              onItemTapped: onItemTapped,
              selectedIndex: selectedIndex,
            ),
          )),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar(
      {super.key, required this.onItemTapped, required this.selectedIndex});
  final int selectedIndex;
  final void Function(int) onItemTapped;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.grid_view_rounded),
          label: 'Dashboard',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.slideshow_rounded),
          label: 'Watch',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.collections),
          label: 'Media Library',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: 'More',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: const Color(AppColors.white),
      unselectedItemColor: const Color(AppColors.bottombarUnSelect),
      backgroundColor: const Color(AppColors.bottomBar),
      enableFeedback: false,
      onTap: onItemTapped,
    );
  }
}


