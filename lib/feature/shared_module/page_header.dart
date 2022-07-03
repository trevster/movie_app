
import 'package:flutter/material.dart';
import 'package:movie_app/utils/movie_constants.dart';

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

class MovieDetailsViewHeader extends SliverPersistentHeaderDelegate {
  final String? imagePath;
  final String title;

  MovieDetailsViewHeader({required this.title, this.imagePath});

  final paddingTop = kDevicePadding.top + 8;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final isShrink = shrinkOffset >= ((maxExtent*0.7) - minExtent);
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(
          imagePath!,
          fit: BoxFit.cover,
        ),
        Opacity(
          opacity: 0.3,
          child: Container(
            color: Colors.black,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: kDevicePadding.top, left: isShrink ? 50 : 0),
          child: Center(
            child: Text(
              title,
              textAlign: isShrink ? TextAlign.left : TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: isShrink ? 20 : 30,
              ),
            ),
          ),
        ),
        Positioned(
          top: paddingTop,
          left: 8,
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 28,
            ),
            onPressed: () {
              Navigator.of(context).maybePop();
            },
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => 200;

  @override
  double get minExtent => kToolbarHeight + paddingTop;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}