
import 'package:flutter/material.dart';

class SliverMovieHeader extends SliverPersistentHeaderDelegate {
  final String? text;

  SliverMovieHeader({this.text});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 70,
      width: double.infinity,
      color: Colors.lightBlue,
      child: Center(
        child: Text(
          text ?? 'Now Playing',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => kToolbarHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}