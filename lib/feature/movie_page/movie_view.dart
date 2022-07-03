import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/feature/movie_details_page/movie_details_view.dart';
import 'package:movie_app/feature/movie_page/movie_bloc.dart';
import 'package:movie_app/movie_widgets/movie_widgets.dart';

class MovieView extends StatelessWidget {
  const MovieView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MovieBloc movieBloc = MovieBloc()..add(const GetNowPlaying());

    return MovieScaffold(
      appBar: AppBar(
        title: const Text('Movies'),
      ),
      body: BlocConsumer<MovieBloc, MovieState>(
        bloc: movieBloc,
        listener: (BuildContext context, MovieState state) {
          if (state.movieViewState == MovieViewState.error) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red.shade500,
            ));
          }
        },
        builder: (BuildContext context, MovieState state) {
          if (state.movieViewState == MovieViewState.loading) return const Center(child: Text('Loading...'));
          if (state.movieViewState == MovieViewState.empty) return const Center(child: Text('Results are empty'));
          return SafeArea(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverPersistentHeader(
                  delegate: SliverMovieHeader(),
                  pinned: true,
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: state.listResult.length,
                    (BuildContext context, int index) {
                      return ListTile(
                        leading: Image.network(state.listResult[index].posterPath!),
                        title: Text('${state.listResult[index].title}'),
                        subtitle: Text('${state.listResult[index].voteAverage} / 10'),
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (_) => MovieDetailsView(movie: state.listResult[index])));
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class SliverMovieHeader extends SliverPersistentHeaderDelegate {
  final Widget? child;

  SliverMovieHeader({this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child ??
        Container(
          padding: const EdgeInsets.all(25),
          height: 70,
          width: double.infinity,
          color: Colors.lightBlue,
          child: const Text(
            'Now Playing',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
  }

  @override
  double get maxExtent => 70;

  @override
  double get minExtent => 70;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
