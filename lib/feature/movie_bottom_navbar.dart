import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/feature/movie_page/movie_view.dart';
import 'package:movie_app/feature/profile_page/profile_view.dart';
import 'package:movie_app/feature/tv_page/tv_view.dart';
import 'package:movie_app/utils/movie_constants.dart';


class MovieBottomNavBar extends StatelessWidget{
  const MovieBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    kDeviceLogicalWidth = MediaQuery.of(context).size.width;
    kDeviceLogicalHeight = MediaQuery.of(context).size.height;
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.local_movies_outlined), activeIcon: Icon(Icons.local_movies_rounded)),
          BottomNavigationBarItem(icon: Icon(Icons.live_tv_rounded),),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline_rounded), activeIcon: Icon(Icons.person_rounded)),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return const <Widget>[
          MovieView(),
          TvView(),
          ProfileView()
        ][index];
      },
    );
  }
}
