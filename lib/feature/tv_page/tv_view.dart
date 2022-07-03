import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/feature/tv_details_page/tv_details_view.dart';
import 'package:movie_app/feature/tv_page/tv_bloc.dart';
import 'package:movie_app/movie_widgets/movie_widgets.dart';

class TvView extends StatelessWidget {
  const TvView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TvBloc movieBloc = TvBloc()..add(const GetTvOnAir());

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
          return CustomScrollView(
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
                      title: Text('${state.listResult[index].name}'),
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) => TvDetailsView(tv: state.listResult[index])));
                      },
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
            'On Air',
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
