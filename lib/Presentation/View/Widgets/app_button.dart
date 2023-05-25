import 'package:flutter/material.dart';

import '../../../app/Config/app_colors.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      this.isTransparent = false,
      required this.text,
      this.icon,
      this.width = 300,
      required this.onPress});
  final bool isTransparent;
  final String text;
  final Icon? icon;
  final VoidCallback onPress;
  final double width;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
         width: width,
        padding: const EdgeInsets.only(top: 15, bottom: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(AppColors.buttonColor)),
          color: isTransparent
              ? Colors.transparent
              : const Color(AppColors.buttonColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ?? Container(),
            Text(
              text,
              //textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: const Color(AppColors.white),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
