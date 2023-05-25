import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/Presentation/Controller/movie_controller.dart';
import 'package:movie_app/Presentation/View/Screens/trailer_screen.dart';
import 'package:movie_app/Presentation/View/Widgets/app_button.dart';
import 'package:movie_app/Presentation/View/Widgets/app_space_component.dart';
import 'package:movie_app/Presentation/View/Widgets/genre_container.dart';
import 'package:movie_app/app/Config/app_colors.dart';

import '../../../Domain/Model/movie.dart';
import '../../../Domain/Model/movie_genre.dart';
import '../../../app/Config/settings.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({super.key, required this.movie});
  final Movie movie;

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late List<Genre> genres;
  late DateTime releaseDate;
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    genres =
        Get.find<MovieController>().getGenresNamebyIds(widget.movie.genreIds);
    releaseDate = DateTime.parse(widget.movie.releaseDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            child: Stack(
              children: [
                Image.network(
                  '${Settings.baseUrlStorage}/${widget.movie.posterPath}',
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 50,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: const Icon(
                              Icons.arrow_back_ios,
                              color: Color(AppColors.white),
                            ),
                          ),
                          Text(
                            "Watch",
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .apply(
                                  color: const Color(AppColors.white),
                                ),
                          ),
                        ],
                      ),
                      Flexible(child: Container()),
                      Center(
                        child: Container(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            children: [
                              Text(
                                "In theaters ${DateFormat.yMMMd().format(releaseDate)}",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .apply(
                                      color: const Color(AppColors.white),
                                    ),
                              ),
                              const AppSpaceComponent(),
                              AppButton(
                                text: "Get Tickets",
                                onPress: () {},
                              ),
                              const AppSpaceComponent(),
                              !widget.movie.video
                                  ? AppButton(
                                      isTransparent: true,
                                      text: "Watch Trailer",
                                      icon: const Icon(
                                        Icons.play_arrow,
                                        color: Color(AppColors.white),
                                      ),
                                      onPress: () {
                                        print("object");
                                        Get.to(TrailerScreen(
                                          movieId: widget.movie.id,
                                        ));
                                      },
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Generes"),
                const AppSpaceComponent(),
                Wrap(
                  runSpacing: 8,
                  children: genres.map((e) {
                    return GenreContainer(genre: e);
                  }).toList(),
                ),
                const AppSpaceComponent(),
                Container(
                  //  padding: EdgeInsets.only(left: 16,right: 16),
                  //width: MediaQuery.of(context).size.width ,
                  height: 1,
                  color: const Color(AppColors.lightGrey),
                ),
                const AppSpaceComponent(
                  height: 20,
                ),
                const Text("Overview"),
                Text(
                  widget.movie.overview,
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: const Color(AppColors.grey),
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
