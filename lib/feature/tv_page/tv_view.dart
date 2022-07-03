import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/feature/shared_module/page_header.dart';
import 'package:movie_app/feature/tv_details_page/tv_details_view.dart';
import 'package:movie_app/feature/tv_page/tv_bloc.dart';
import 'package:movie_app/movie_widgets/movie_widgets.dart';

class TvView extends StatelessWidget {
  const TvView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TvBloc movieBloc = TvBloc()
      ..add(const GetTvOnAir())
      ..add(const GetTvPopular());

    return MovieScaffold(
      appBar: AppBar(
        title: const Text('Tv'),
      ),
      body: BlocConsumer<TvBloc, TvState>(
        bloc: movieBloc,
        listener: (BuildContext context, TvState state) {
          if (state.tvViewState == TvViewStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red.shade500,
            ));
          }
        },
        builder: (BuildContext context, TvState state) {
          if (state.tvViewState == TvViewStatus.loading) return const Center(child: Text('Loading...'));
          if (state.tvViewState == TvViewStatus.empty) return const Center(child: Text('Results are empty'));
          return SafeArea(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverPersistentHeader(
                  delegate: SliverMovieHeader(text: 'On Air'),
                  pinned: true,
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: state.listTvOnAir.length,
                    (BuildContext context, int index) {
                      return ListTile(
                        leading: Image.network(state.listTvOnAir[index].posterPath!),
                        title: Text('${state.listTvOnAir[index].name}'),
                        subtitle: Text('${state.listTvOnAir[index].voteAverage}'),
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (_) => TvDetailsView(tv: state.listTvOnAir[index])));
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
                        title: Text('${state.listPopular[index].name}'),
                        subtitle: Text('${state.listPopular[index].popularity}'),
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (_) => TvDetailsView(tv: state.listPopular[index])));
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
