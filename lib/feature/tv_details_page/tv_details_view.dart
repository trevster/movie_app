import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/feature/shared_module/page_header.dart';
import 'package:movie_app/feature/shared_module/page_overview.dart';
import 'package:movie_app/feature/tv_details_page/tv_details_bloc.dart';
import 'package:movie_app/models/tv/TvOnAirModel.dart';
import 'package:movie_app/movie_widgets/movie_widgets.dart';

class TvDetailsView extends StatelessWidget {
  final Results tv;

  const TvDetailsView({
    Key? key,
    required this.tv,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TvDetailsBloc tvDetailsBloc = TvDetailsBloc()..add(GetTvDetails(tv.id!));
    return MovieScaffold(
      body: BlocConsumer<TvDetailsBloc, TvDetailsState>(
        bloc: tvDetailsBloc,
        listener: (context, state) {
          if (state.tvDetailStatus == TvDetailStatus.error) {
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
                  imagePath: tv.posterPath!,
                  title: tv.name!,
                ),
              ),
              ItemOverview(
                title: tv.name!,
                voteCount: tv.voteCount!.toString(),
                voteAverage: tv.voteAverage!.toString(),
                imagePath: tv.posterPath!,
                overview: tv.overview!,
              ),
              if (state.tvDetailStatus == TvDetailStatus.loading)
                const SliverToBoxAdapter(
                  child: Center(child: Text('Loading')),
                ),
              if (state.tvDetailStatus == TvDetailStatus.empty)
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
