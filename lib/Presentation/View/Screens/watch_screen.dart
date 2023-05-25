import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/Domain/Model/movie.dart';
import 'package:movie_app/Presentation/Controller/movie_controller.dart';
import 'package:movie_app/Presentation/View/Screens/movie_detail_screen.dart';
import 'package:movie_app/Presentation/View/Widgets/app_space_component.dart';
import 'package:movie_app/Presentation/View/Widgets/movie_component.dart';
import 'package:movie_app/Presentation/View/Widgets/search_bar.dart';
import 'package:dartz/dartz.dart' as dartz;
import 'package:movie_app/Presentation/View/Widgets/search_item_component.dart';

import '../../../app/Config/app_colors.dart';

class WatchScreen extends StatefulWidget {
  const WatchScreen({super.key});

  @override
  State<WatchScreen> createState() => _WatchScreenState();
}

class _WatchScreenState extends State<WatchScreen> {
  final movieController = Get.find<MovieController>();
  bool isSearching = false;
  String searchText = "";
  List<Movie> searchMovies = [];
  late List<dartz.Tuple2<String, String>> genreImages;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    genreImages = movieController.getImageOfEachGenre();
  }

  void onPressSearch() {
    setState(() {
      movieController.getImageOfEachGenre();
      isSearching = !isSearching;
      if (searchText != "") {
        searchText = "";
      }
    });
  }

  void onChangeText(String text) {
    print(text);
    final List<Movie> res = movieController.searchMovies(text);
    setState(() {
      searchText = text;
      searchMovies = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        //elevation: 5,
        title: isSearching
            ? AppSearchBar(
                onPressCross: onPressSearch,
                onChange: onChangeText,
              )
            : Text(
                "Watch",
                style: Theme.of(context).textTheme.displayMedium,
              ),
        actions: [
          isSearching
              ? Container()
              : Container(
                  padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child: GestureDetector(
                      onTap: onPressSearch, child: const Icon(Icons.search))),
        ],
      ),
      body: SafeArea(
        child: Container(
            padding: const EdgeInsets.all(20),
            child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              if (searchText != "") {
                return SearchResults(movies: searchMovies);
              } else if (isSearching) {
                return GenresList(genres: genreImages);
              } else {
                return MoviesList(movies: movieController.movies);
              }
            })),
      ),
    );
  }
}

class MoviesList extends StatelessWidget {
  const MoviesList({super.key, required this.movies});
  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: movies.length,
        itemBuilder: (BuildContext context, int index) {
          return MovieComponent(
            backDropPath: movies[index].backdropPath,
            title: movies[index].title,
            onPress: () {
              Get.to(MovieDetailScreen(
                movie: movies[index],
              ));
            },
          );
        });
  }
}

class GenresList extends StatelessWidget {
  const GenresList({super.key, required this.genres});
  final List<dartz.Tuple2<String, String>> genres;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemCount: genres.length,
        itemBuilder: (BuildContext ctx, index) {
          return MovieComponent(
            backDropPath: genres[index].value1,
            title: genres[index].value2,
            onPress: () {
              // Get.to(MovieDetailScreen(
              //   movie: movies[index],
              // ));
            },
          );
        });
  }
}

class SearchResults extends StatelessWidget {
  const SearchResults({super.key, required this.movies});
  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Top Results",
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const AppSpaceComponent(),
        Container(
          //  padding: EdgeInsets.only(left: 16,right: 16),
          //width: MediaQuery.of(context).size.width ,
          height: 1,
          color: const Color(AppColors.lightGrey),
        ),
        const AppSpaceComponent(),
        Expanded(
          child: Container(
            child: ListView.builder(
                itemCount: movies.length,
                itemBuilder: (BuildContext context, int index) {
                  return SearchItemComponent(
                    genre: jsonDecode(movies[index].genreIds) ,
                    backDropPath: movies[index].backdropPath,
                    title: movies[index].title,
                    onPress: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      Get.to(MovieDetailScreen(
                        movie: movies[index],
                      ));
                    },
                  );
                }),
          ),
        ),
      ],
    );
  }
}
