import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/feature/movie_details_page/movie_details_bloc.dart';
import 'package:movie_app/models/NowPlayingModel.dart';
import 'package:movie_app/movie_widgets/movie_widgets.dart';
import 'package:movie_app/utils/movie_constants.dart';

class MovieDetailsView extends StatelessWidget {
  final Results movie;

  const MovieDetailsView({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MovieDetailsBloc movieDetailsBloc = MovieDetailsBloc()..add(GetMovieDetails(movie.id!));
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
              const SliverAppBar(pinned: true,),
              SliverPadding(
                padding: const EdgeInsets.all(20),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    <Widget>[
                      Row(
                        children: <Widget>[
                          Image.network(
                            movie.posterPath!,
                            width: kDeviceLogicalWidth * 0.4,
                          ),
                          const SizedBox(width: 20,),
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Text(movie.title!),
                                Text(movie.voteAverage!.toString()),
                                Text('Votes ${movie.voteCount!}'),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20,),
                      Text(movie.overview!,),
                    ],
                  ),
                ),
              ),
              if (state.movieDetailStatus == MovieDetailStatus.loading)
                const SliverToBoxAdapter(
                  child: Center(child: Text('Loading')),
                ),
              if (state.movieDetailStatus == MovieDetailStatus.empty)
                const SliverToBoxAdapter(
                  child: Center(child: Text('Empty')),
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
            ],
          );
        },
      ),
    );
  }
}
