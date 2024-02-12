import 'package:flutter/material.dart';
import 'package:movie_magic/model/movie.dart';
import 'package:movie_magic/utils/colors.dart';
import 'package:movie_magic/utils/constants.dart';
import 'package:movie_magic/utils/sizes.dart';
import 'package:movie_magic/utils/text_style.dart';
import 'package:movie_magic/widgets/back_button.dart';

class DetailScreen extends StatefulWidget {
  final Movie movie;
  const DetailScreen({super.key, required this.movie});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            expandedHeight: Sizes.mediaHeight(context: context, height: 0.65),
            title: Text(
              '${widget.movie.title}',
              maxLines: 1,
              style: CustomTextStyle.robotoRegular(
                  fontSize: Sizes.mediaWidth(context: context, width: 0.05),
                  color: CustomColors.white,
                  fontWeight: FontWeight.w600),
            ),
            backgroundColor: CustomColors.black,
            pinned: true,
            centerTitle: true,
            flexibleSpace: FlexibleSpaceBar(
              background: ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
                child: Image.network(
                  '$imagePath${widget.movie.posterPath}',
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ),
            leading: const BackButtonWidget(),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'OverView',
                    style: CustomTextStyle.protestRiot(
                        fontSize:
                            Sizes.mediaWidth(context: context, width: 0.08),
                        color: Colors.white),
                  ),
                  Text(
                    '${widget.movie.overview}',
                    style: CustomTextStyle.robotoRegular(
                        fontSize:
                            Sizes.mediaWidth(context: context, width: 0.045),
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Container(
                        width: Sizes.mediaWidth(context: context, width: 0.52),
                        padding: const EdgeInsets.all(6),
                        margin: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 2, color: CustomColors.white),
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          children: [
                            Text(
                              'Release Date: ',
                              style: CustomTextStyle.robotoRegular(
                                  fontSize: Sizes.mediaWidth(
                                      context: context, width: 0.04),
                                  color: Colors.white),
                            ),
                            Text(
                              '${widget.movie.releaseDate}',
                              style: CustomTextStyle.robotoRegular(
                                  fontSize: Sizes.mediaWidth(
                                      context: context, width: 0.04),
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: Sizes.mediaWidth(context: context, width: 0.34),
                        padding: const EdgeInsets.all(6),
                        margin: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 2, color: CustomColors.white),
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          children: [
                            Text(
                              'Rating ',
                              style: CustomTextStyle.robotoRegular(
                                  fontSize: Sizes.mediaWidth(
                                      context: context, width: 0.04),
                                  color: Colors.white),
                            ),
                            Icon(
                              Icons.star_half,
                              color: Colors.yellowAccent,
                            ),
                            Text(
                              ' : ${widget.movie.voteAverage!.toStringAsFixed(0)}/10',
                              style: CustomTextStyle.robotoRegular(
                                  fontSize: Sizes.mediaWidth(
                                      context: context, width: 0.04),
                                  color: Colors.white),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
