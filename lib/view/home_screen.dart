import 'package:flutter/material.dart';
import 'package:movie_magic/APIs/apis.dart';
import 'package:movie_magic/model/movie.dart';
import 'package:movie_magic/utils/colors.dart';
import 'package:movie_magic/utils/sizes.dart';
import 'package:movie_magic/utils/text_style.dart';
import 'package:movie_magic/widgets/category_title.dart';
import 'package:movie_magic/widgets/movie_slider.dart';
import 'package:movie_magic/widgets/trending_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Movie>> trendingMovie;
  late Future<List<Movie>> popularMovie;
  late Future<List<Movie>> topRatedMovie;
  late Future<List<Movie>> upComingMovie;
  @override
  void initState() {
    super.initState();
    trendingMovie = APIs().getTrendingMovie();
    popularMovie = APIs().getPopularMovie();
    topRatedMovie = APIs().getTopRatedMovie();
    upComingMovie = APIs().getUpComingMovie();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.black,
      appBar: AppBar(
        toolbarHeight: Sizes.mediaHeight(context: context, height: 0.055),
        backgroundColor: CustomColors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Image.asset(
                'assets/images/movie.png',
                filterQuality: FilterQuality.high,
                height: Sizes.mediaHeight(context: context, height: 0.05),
              ),
            ),
            Text(
              'MovieMagic',
              style: CustomTextStyle.protestRiot(
                  fontSize: Sizes.mediaWidth(context: context, width: 0.08),
                  color: CustomColors.lightRed),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CategoryTitle(
              title: 'Trending Movies',
            ),
            SizedBox(
              child: FutureBuilder(
                  future: trendingMovie,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return TrendingSlider(
                        snapshot: snapshot,
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          color: CustomColors.darkRed,
                        ),
                      );
                    }
                  }),
            ),
            const CategoryTitle(
              title: 'Popular Movies',
            ),
            SizedBox(
              child: FutureBuilder(
                  future: popularMovie,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return MovieSlider(
                        snapshot: snapshot,
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          color: CustomColors.darkRed,
                        ),
                      );
                    }
                  }),
            ),
            const CategoryTitle(
              title: 'Top Rated Movies',
            ),
            SizedBox(
              child: FutureBuilder(
                  future: topRatedMovie,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return MovieSlider(
                        snapshot: snapshot,
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          color: CustomColors.darkRed,
                        ),
                      );
                    }
                  }),
            ),
            const CategoryTitle(
              title: 'Upcoming Movies',
            ),
            SizedBox(
              child: FutureBuilder(
                  future: upComingMovie,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return MovieSlider(
                        snapshot: snapshot,
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          color: CustomColors.darkRed,
                        ),
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
