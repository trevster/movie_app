import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/feature/movie_details_page/movie_details_bloc.dart';
import 'package:movie_app/models/movie/NowPlayingModel.dart';
import 'package:movie_app/movie_widgets/movie_widgets.dart';
import 'package:movie_app/utils/movie_constants.dart';

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
              SliverPersistentHeader(
                pinned: true,
                delegate: MovieDetailsViewHeader(
                  imagePath: movie.posterPath!,
                  title: movie.title!,
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    <Widget>[
                      Row(
                        children: <Widget>[
                          Image.network(
                            movie.posterPath!,
                            width: kDeviceLogicalWidth * 0.4,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Text(movie.title!, textAlign: TextAlign.center,),
                                const SizedBox(height: 5,),
                                Text('${movie.voteAverage!.toString()} / 10'),
                                const SizedBox(height: 5,),
                                Text('${movie.voteCount!} votes'),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text('Overview:', style: TextStyle(fontWeight: FontWeight.w500),),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        movie.overview!,
                      ),
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
              const SliverToBoxAdapter(child: Divider()),
              const SliverToBoxAdapter(child: Padding(
                padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Text('Reviews:', style: TextStyle(fontWeight: FontWeight.w500),),
              )),
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
