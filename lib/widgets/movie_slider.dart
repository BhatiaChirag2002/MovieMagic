import 'package:flutter/material.dart';
import 'package:movie_magic/utils/constants.dart';
import 'package:movie_magic/utils/page_route_transition.dart';
import 'package:movie_magic/utils/sizes.dart';
import 'package:movie_magic/view/detail_screen.dart';

class MovieSlider extends StatelessWidget {
  final AsyncSnapshot snapshot;
  const MovieSlider({
    super.key,
    required this.snapshot,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizes.mediaWidth(context: context, width: 0.55),
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Sizes.mediaWidth(context: context, width: 0.02)),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(createRoute(
                      screenName: DetailScreen(
                    movie: snapshot.data[index],
                  )));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    width: Sizes.mediaWidth(context: context, width: 0.4),
                    child: Image.network(
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.fill,
                        '$imagePath${snapshot.data[index].posterPath}'),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
