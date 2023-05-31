import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/Presentation/View/Screens/seat_selection_seat.dart';
import 'package:movie_app/Presentation/View/Widgets/app_button.dart';
import 'package:movie_app/Presentation/View/Widgets/app_space_component.dart';
import 'package:movie_app/app/Config/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HallSelectionScreen extends StatefulWidget {
  const HallSelectionScreen(
      {super.key, required this.movieDate, required this.movieTitle});
  final String movieTitle;
  final DateTime movieDate;

  @override
  State<HallSelectionScreen> createState() => _HallSelectionScreenState();
}

class _HallSelectionScreenState extends State<HallSelectionScreen> {
  final controller = PageController(viewportFraction: 0.95, keepPage: true);
  static const List<String> dates = [
    "5 Mar",
    "6 Mar",
    "7 Mar",
    "8 Mar",
    "9 Mar",
    "10 Mar",
    "11 Mar",
    "12 Mar"
  ];
  static const List<String> cenimaHalls = [
    "Cinetech + hall 1",
    "Cinetech + hall 2",
    "Cinetech + hall 3",
    "Cinetech + hall 4",
    "Cinetech + hall 5",
    "Cinetech + hall 6",
  ];
  static String selectedDate = dates[0];
  static String selectedHall = cenimaHalls[0];
  int idx = 0;
  onSelectDate(String date) {
    setState(() {
      selectedDate = date;
    });
  }

  void onSelectHall(String hall) {
    setState(() {
      selectedHall = hall;
    });
  }

  final pages = List.generate(
      6,
      (index) => Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      "12:30",
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      cenimaHalls[index],
                      style: const TextStyle(color: Color(AppColors.grey)),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    //onSelectHall(cenimaHalls[index]);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: const Color(AppColors.white),
                      border: Border.all(
                          color: Color((selectedHall == cenimaHalls[index])
                              ? AppColors.buttonColor
                              : AppColors.lightGrey)),
                    ),
                    margin: const EdgeInsets.only(
                      right: 20,
                      top: 4,
                    ),
                    child: SizedBox(
                      height: 180,
                      child: Center(
                          child: Image.asset("assets/images/hall_image.png")),
                    ),
                  ),
                ),
              ],
            ),
          ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Column(
            children: [
              Text(
                widget.movieTitle,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Text(
                "In theaters ${DateFormat.yMMMd().format(widget.movieDate)}",
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .apply(color: const Color(AppColors.buttonColor)),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppSpaceComponent(
              height: 50,
            ),
            Text(
              "Date",
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const AppSpaceComponent(),
            SizedBox(
              height: 30,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: dates.map((date) {
                  return GestureDetector(
                    onTap: () {
                      onSelectDate(date);
                    },
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 6, bottom: 6, left: 12, right: 12),
                      margin: const EdgeInsets.only(right: 7),
                      //color: Color(AppColors.genresColor[3]),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color((selectedDate == date)
                            ? AppColors.buttonColor
                            : AppColors.searchBarColor),
                      ),
                      child: Text(
                        date,
                        style: Theme.of(context).textTheme.displayMedium!.apply(
                            color: Color((selectedDate == date)
                                ? AppColors.white
                                : AppColors.black)),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const AppSpaceComponent(
              height: 50,
            ),
            SizedBox(
              height: 240,
              child: PageView.builder(
                controller: controller,
                // itemCount: pages.length,
                itemBuilder: (_, index) {
                  return pages[index % pages.length];
                },
              ),
            ),
            Center(
              child: SmoothPageIndicator(
                controller: controller, // PageController
                count: 6,
                effect: const WormEffect(), // your preferred effect
              ),
            ),
            Flexible(child: Container()),
            AppButton(
              text: "Select Seats",
              onPress: () {
                print("press");
                Get.to(SeatSelectionScreen(
                    movieDate: widget.movieDate,
                    movieTitle: widget.movieTitle));
              },
              width: MediaQuery.of(context).size.width,
            ),
          ],
        ),
      ),
    );
  }
}
