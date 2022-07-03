
import 'package:flutter/material.dart';
import 'package:movie_app/feature/movie_bottom_navbar.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MovieBottomNavBar(),
    );
  }
}
