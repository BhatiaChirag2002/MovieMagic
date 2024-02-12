import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_magic/utils/constants.dart';
import 'package:movie_magic/utils/page_route_transition.dart';
import 'package:movie_magic/utils/sizes.dart';
import 'package:movie_magic/view/detail_screen.dart';

class TrendingSlider extends StatelessWidget {
  final AsyncSnapshot snapshot;
  const TrendingSlider({
    super.key,
    required this.snapshot,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
          itemCount: snapshot.data!.length,
          options: CarouselOptions(
              enlargeCenterPage: true,
              enlargeFactor: 0.4,
              pageSnapping: true,
              height: Sizes.mediaWidth(context: context, width: 0.65), //300,
              autoPlay: true,
              viewportFraction: 0.46,
              autoPlayCurve: Curves.fastOutSlowIn,
              autoPlayAnimationDuration: const Duration(milliseconds: 2000)),
          itemBuilder: (context, itemIndex, pageViewIndex) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(createRoute(
                    screenName: DetailScreen(
                  movie: snapshot.data[itemIndex],
                )));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  width: Sizes.mediaWidth(context: context, width: 0.5),
                  child: Image.network(
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.fill,
                      '$imagePath${snapshot.data[itemIndex].posterPath}'),
                ),
              ),
            );
          }),
    );
  }
}
