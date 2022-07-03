import 'package:flutter/material.dart';
import 'package:movie_app/movie_widgets/movie_widgets.dart';

class TvView extends StatelessWidget {
  const TvView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MovieScaffold(
      body: Center(child: Text('Television Shows'),),
    );
  }
}
