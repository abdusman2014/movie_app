import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/Presentation/View/Widgets/app_space_component.dart';
import 'package:movie_app/app/Config/app_colors.dart';

import '../../../Domain/Model/movie_genre.dart';
import '../../../app/Config/settings.dart';
import '../../Controller/movie_controller.dart';

class SearchItemComponent extends StatefulWidget {
  const SearchItemComponent(
      {super.key,
      required this.genre,
      required this.title,
      required this.backDropPath, required this.onPress});
  final String title;
  final List<dynamic> genre;
  final String backDropPath;
  final Function() onPress;

  @override
  State<SearchItemComponent> createState() => _SearchItemComponentState();
}

class _SearchItemComponentState extends State<SearchItemComponent> {
  late List<Genre> genres;
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    genres = Get.find<MovieController>().getGenresNamebyIds(widget.genre);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPress,
      child: Container(
        padding: const EdgeInsets.only(bottom: 20),
        color: Colors.transparent,
        child: Row(
          children: [
            Container(
              width: 130,
              height: 100,
              margin: const EdgeInsets.only(right: 12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/images/loading.jpeg',
                  image: '${Settings.baseUrlStorage}/${widget.backDropPath}',
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const AppSpaceComponent(),
                  Text(
                    genres[0].name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .apply(color: const Color(AppColors.grey)),
                  ),
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.only(left: 12),
                child: const Icon(Icons.more_horiz))
          ],
        ),
      ),
    );
  }
}
