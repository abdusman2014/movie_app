import 'dart:math';

import 'package:flutter/material.dart';
import 'package:movie_app/Domain/Model/movie_genre.dart';
import 'package:movie_app/app/Config/app_colors.dart';

class GenreContainer extends StatelessWidget {
  const GenreContainer({super.key, required this.genre});
  final Genre genre;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 6, bottom: 6, left: 12, right: 12),
      margin: const EdgeInsets.only(right: 7),
      //color: Color(AppColors.genresColor[3]),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(AppColors
            .genresColor[(Random()).nextInt(AppColors.genresColor.length)]),
      ),
      child: Text(
        genre.name,
        style: Theme.of(context)
            .textTheme
            .bodySmall!
            .apply(color: const Color(AppColors.white)),
      ),
    );
  }
}
