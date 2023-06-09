import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/Presentation/Controller/movie_controller.dart';
import 'package:movie_app/Presentation/View/Screens/hall_selection_screen.dart';
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
    // final List<int> gen = jsonDecode(widget.movie.genreIds);
    // print(gen);
    genres = Get.find<MovieController>()
        .getGenresNamebyIds(jsonDecode(widget.movie.genreIds));
    releaseDate = DateTime.parse(widget.movie.releaseDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return PortraitComponent(
              movie: widget.movie, genres: genres, releaseDate: releaseDate);
        } else {
          return LandscapeComponent(
              genres: genres, movie: widget.movie, releaseDate: releaseDate);
        }
      }),
    );
  }
}

class PortraitComponent extends StatelessWidget {
  const PortraitComponent(
      {super.key,
      required this.movie,
      required this.genres,
      required this.releaseDate});
  final Movie movie;
  final DateTime releaseDate;
  final List<Genre> genres;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 2,
          child: Stack(
            children: [
              Image.network(
                '${Settings.baseUrlStorage}/${movie.posterPath}',
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
                          style:
                              Theme.of(context).textTheme.displayMedium!.apply(
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
                              onPress: () {
                                Get.to(HallSelectionScreen(
                                    movieTitle: movie.title,
                                    movieDate: releaseDate));
                              },
                            ),
                            const AppSpaceComponent(),
                            AppButton(
                              isTransparent: true,
                              text: "Watch Trailer",
                              icon: const Icon(
                                Icons.play_arrow,
                                color: Color(AppColors.white),
                              ),
                              onPress: () {
                                print("object");
                                Get.to(TrailerScreen(
                                  movieId: movie.id,
                                ));
                              },
                            ),
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
                movie.overview,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: const Color(AppColors.grey),
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class LandscapeComponent extends StatelessWidget {
  const LandscapeComponent(
      {super.key,
      required this.genres,
      required this.movie,
      required this.releaseDate});
  final Movie movie;
  final DateTime releaseDate;
  final List<Genre> genres;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 2,
          child: Stack(
            children: [
              Image.network(
                '${Settings.baseUrlStorage}/${movie.posterPath}',
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width / 2,
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
                          style:
                              Theme.of(context).textTheme.displayMedium!.apply(
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
                              movie.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .apply(
                                    color: const Color(AppColors.golden),
                                  ),
                            ),
                            const AppSpaceComponent(),
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
                            Row(
                              children: [
                                AppButton(
                                  text: "Get Tickets",
                                  onPress: () {
                                    Get.to(HallSelectionScreen(
                                    movieTitle: movie.title,
                                    movieDate: releaseDate));
                                  },
                                  width: MediaQuery.of(context).size.width / 4 -
                                      50,
                                ),
                                Container(width: 10),
                                AppButton(
                                  isTransparent: true,
                                  text: "Watch Trailer",
                                  icon: const Icon(
                                    Icons.play_arrow,
                                    color: Color(AppColors.white),
                                  ),
                                  onPress: () {
                                    print("object");
                                    Get.to(TrailerScreen(
                                      movieId: movie.id,
                                    ));
                                  },
                                  width: MediaQuery.of(context).size.width / 4 -
                                      50,
                                ),
                              ],
                            )
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
          width: MediaQuery.of(context).size.width / 2,
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
                movie.overview,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: const Color(AppColors.grey),
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
