import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/Presentation/View/Widgets/app_button.dart';
import 'package:movie_app/Presentation/View/Widgets/app_space_component.dart';

import '../../../app/Config/app_colors.dart';

class SeatSelectionScreen extends StatelessWidget {
  const SeatSelectionScreen(
      {super.key, required this.movieDate, required this.movieTitle});
  final String movieTitle;
  final DateTime movieDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Column(
            children: [
              Text(
                movieTitle,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Text(
                "In theaters ${DateFormat.yMMMd().format(movieDate)}",
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .apply(color: const Color(AppColors.buttonColor)),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Flexible(
            flex: 4,
            fit: FlexFit.tight,
            child: Container(
              padding: const EdgeInsets.all(12),
              color: const Color(AppColors.backGround),
              child: Column(
                children: [
                  const AppSpaceComponent(
                    height: 60,
                  ),
                  Image.asset("assets/images/seat_image.png", width: 400),
                  Flexible(child: Container()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 29,
                        width: 29,
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color: const Color(AppColors.white),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Color(AppColors.black),
                          size: 15,
                        ),
                      ),
                      Container(
                        height: 29,
                        width: 29,
                        decoration: BoxDecoration(
                          color: const Color(AppColors.white),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(
                          Icons.remove,
                          color: Color(AppColors.black),
                          size: 15,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Container(
              //height: 400,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              color: const Color(AppColors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Wrap(
                    runSpacing: 6, //add vertical spacing between components
                    children: [
                      SeatStatusComponent(
                        color: AppColors.golden,
                        text: "Selected",
                      ),
                      SeatStatusComponent(
                        color: AppColors.grey,
                        text: "Not available",
                      ),
                      SeatStatusComponent(
                        color: AppColors.pruple,
                        text: "Vip (150\$)",
                      ),
                      SeatStatusComponent(
                        color: AppColors.buttonColor,
                        text: "Regular (50\$)",
                      ),
                    ],
                  ),
                  const AppSpaceComponent(
                    height: 20,
                  ),
                  Container(
                      width: 120,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(AppColors.lightGrey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "4 / 3 row",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(
                            Icons.close,
                            size: 20,
                          )
                        ],
                      )),
                  Expanded(child: Container()),
                  Row(
                    children: [
                      Container(
                        width: 120,
                        margin: const EdgeInsets.only(right: 8),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(AppColors.lightGrey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Text(
                              "Total Price",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "50\$",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: AppButton(
                          text: "Proceed to pay",
                          onPress: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SeatStatusComponent extends StatelessWidget {
  const SeatStatusComponent(
      {super.key, required this.color, required this.text});
  final int color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 50,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 8),
            child: Icon(
              Icons.event_seat,
              color: Color(color),
            ),
          ),
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .apply(color: const Color(AppColors.grey)),
          )
        ],
      ),
    );
  }
}
