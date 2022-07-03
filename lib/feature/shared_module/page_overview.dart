import 'package:flutter/material.dart';
import 'package:movie_app/utils/movie_constants.dart';

class ItemOverview extends StatelessWidget {
  final String imagePath;
  final String title;
  final String voteAverage;
  final String voteCount;
  final String overview;

  const ItemOverview({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
    required this.overview,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          <Widget>[
            Row(
              children: <Widget>[
                Image.network(
                  imagePath,
                  width: kDeviceLogicalWidth * 0.4,
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Text(
                        title,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text('$voteAverage / 10'),
                      const SizedBox(
                        height: 5,
                      ),
                      Text('$voteCount votes'),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Overview:',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              overview,
            ),
          ],
        ),
      ),
    );
  }
}
