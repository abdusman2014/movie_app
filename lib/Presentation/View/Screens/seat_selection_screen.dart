import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/Presentation/View/Widgets/app_button.dart';
import 'package:movie_app/Presentation/View/Widgets/app_space_component.dart';
import 'package:movie_app/app/Config/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SeatSelectionScreen extends StatefulWidget {
 const SeatSelectionScreen(
      {super.key, required this.movieDate, required this.movieTitle});
  final String movieTitle;
  final DateTime movieDate;
  

  @override
  State<SeatSelectionScreen> createState() => _SeatSelectionScreenState();
}

class _SeatSelectionScreenState extends State<SeatSelectionScreen> {
  final controller = PageController(viewportFraction: 0.95, keepPage: true);
  static const List<String> dates = [
    "5 Mar",
    "6 Mar",
    "7 Mar",
    "8 Mar",
    "5 Mar",
    "6 Mar",
    "7 Mar",
    "8 Mar"
  ];
  static const List<String> cenimaHalls = [
    "Cinetech + hall 1",
    "Cinetech + hall 2",
    "Cinetech + hall 3",
    "Cinetech + hall 4",
    "Cinetech + hall 5",
    "Cinetech + hall 6",
  ];
  

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
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color(AppColors.white),
                    border:
                        Border.all(color: const Color(AppColors.buttonColor)),
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
            Container(
              height: 30,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: dates.map((date) {
                  return Container(
                    padding: const EdgeInsets.only(
                        top: 6, bottom: 6, left: 12, right: 12),
                    margin: const EdgeInsets.only(right: 7),
                    //color: Color(AppColors.genresColor[3]),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(AppColors.buttonColor),
                    ),
                    child: Text(
                      date,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .apply(color: const Color(AppColors.white)),
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
            AppButton(text: "Select Seats", onPress: (){},width: MediaQuery.of(context).size.width,),
          ],
        ),
      ),
    );
  }
}
