import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/feature/movie_details_page/movie_details_view.dart';
import 'package:movie_app/feature/movie_page/movie_bloc.dart';
import 'package:movie_app/movie_widgets/movie_widgets.dart';

class MovieView extends StatelessWidget {
  const MovieView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MovieBloc movieBloc = MovieBloc()
      ..add(const GetNowPlaying())
      ..add(const GetUpcoming())
      ..add(const GetPopular());

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
                    childCount: state.listNowPlaying.length,
                    (BuildContext context, int index) {
                      return ListTile(
                        leading: Image.network(state.listNowPlaying[index].posterPath!),
                        title: Text('${state.listNowPlaying[index].title}'),
                        subtitle: Text('${state.listNowPlaying[index].voteAverage} / 10'),
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => MovieDetailsView(movie: state.listNowPlaying[index])));
                        },
                      );
                    },
                  ),
                ),
                SliverPersistentHeader(
                  delegate: SliverMovieHeader(text: 'Upcoming'),
                  pinned: true,
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: state.listUpcoming.length,
                    (BuildContext context, int index) {
                      return ListTile(
                        leading: Image.network(state.listUpcoming[index].posterPath!),
                        title: Text('${state.listUpcoming[index].title}'),
                        subtitle: Text('${state.listUpcoming[index].releaseDate}'),
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => MovieDetailsView(movie: state.listUpcoming[index])));
                        },
                      );
                    },
                  ),
                ),
                SliverPersistentHeader(
                  delegate: SliverMovieHeader(text: 'Popular'),
                  pinned: true,
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: state.listPopular.length,
                    (BuildContext context, int index) {
                      return ListTile(
                        leading: Image.network(state.listPopular[index].posterPath!),
                        title: Text('${state.listPopular[index].title}'),
                        subtitle: Text('${state.listPopular[index].popularity}'),
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => MovieDetailsView(movie: state.listPopular[index])));
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
