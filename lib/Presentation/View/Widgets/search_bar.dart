import 'package:flutter/material.dart';
import 'package:movie_app/app/Config/app_colors.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({super.key, required this.onPressCross, required this.onChange});
  final VoidCallback onPressCross;
  final Function(String value) onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      //padding: const EdgeInsets.only(top: 4, bottom: 4),
      margin: const EdgeInsets.only(top: 4, bottom: 4),
      height: 45,
      decoration: BoxDecoration(
        color: const Color(AppColors.searchBarColor),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: TextField(
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              suffixIcon: IconButton(
                icon: const Icon(
                  Icons.clear,
                  color: Color(AppColors.grey),
                ),
                onPressed: () {
                  /* Clear the search field */
                  onPressCross();
                },
              ),
              hintText: 'Search...',
              border: InputBorder.none),
          onChanged:onChange,
        ),
      ),
    );
  }
}
