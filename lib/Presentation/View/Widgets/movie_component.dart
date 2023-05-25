import 'package:flutter/material.dart';
import 'package:movie_app/app/Config/settings.dart';

import '../../../app/Config/app_colors.dart';

class MovieComponent extends StatelessWidget {
  const MovieComponent(
      {super.key,
      required this.backDropPath,
      required this.title,
      required this.onPress});
  final String backDropPath;
  final String title;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 220,
      //  width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/images/loading.jpeg',
                image: '${Settings.baseUrlStorage}/$backDropPath',
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 20,
              left: 15,
              width: MediaQuery.of(context).size.width / 1.5,
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .apply(color: const Color(AppColors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
