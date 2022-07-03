import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/feature/movie_details_page/movie_details_bloc.dart';
import 'package:movie_app/feature/shared_module/page_header.dart';
import 'package:movie_app/feature/shared_module/page_overview.dart';
import 'package:movie_app/models/movie/NowPlayingModel.dart';
import 'package:movie_app/movie_widgets/movie_widgets.dart';

class MovieDetailsView extends StatelessWidget {
  final Results movie;

  const MovieDetailsView({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MovieDetailsBloc movieDetailsBloc = MovieDetailsBloc()
      ..add(GetMovieDetails(movie.id!));
    return MovieScaffold(
      body: BlocConsumer<MovieDetailsBloc, MovieDetailsState>(
        bloc: movieDetailsBloc,
        listener: (context, state) {
          if (state.movieDetailStatus == MovieDetailStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red.shade500,
            ));
          }
        },
        builder: (context, state) {
          return CustomScrollView(
            slivers: <Widget>[
              SliverPersistentHeader(
                pinned: true,
                delegate: MovieDetailsViewHeader(
                  imagePath: movie.posterPath!,
                  title: movie.title!,
                ),
              ),
              ItemOverview(
                title: movie.title!,
                voteCount: movie.voteCount!.toString(),
                voteAverage: movie.voteAverage!.toString(),
                imagePath: movie.posterPath!,
                overview: movie.overview!,
              ),
              const SliverToBoxAdapter(child: Divider()),
              const SliverToBoxAdapter(child: Padding(
                padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Text('Reviews:', style: TextStyle(fontWeight: FontWeight.w500),),
              )),
              if (state.movieDetailStatus == MovieDetailStatus.loading)
                const SliverPadding(
                  padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                  sliver: SliverToBoxAdapter(
                    child: Center(child: Text('Loading reviews...')),
                  ),
                ),
              if (state.movieDetailStatus == MovieDetailStatus.loaded && state.reviews!.results!.isEmpty)
                const SliverPadding(
                  padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                  sliver: SliverToBoxAdapter(
                    child: Center(child: Text('No Reviews')),
                  ),
                ),
              if (state.reviews != null)
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: state.reviews!.results!.length,
                        (BuildContext context, int index) {
                      return ListTile(
                        title: Text(state.reviews!.results![index].author!),
                        subtitle: Text(state.reviews!.results![index].content!),
                      );
                    },
                  ),
                ),
              const SliverToBoxAdapter(child: Divider()),
            ],
          );
        },
      ),
    );
  }
}
