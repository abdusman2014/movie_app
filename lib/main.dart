import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/Data/Repository_Impl/movie_repository_impl.dart';
import 'package:movie_app/Domain/Repository/movie_repository.dart';
import 'package:movie_app/Presentation/Controller/movie_controller.dart';
import 'package:movie_app/app/Services/floor_storage.dart';
import 'Presentation/View/Screens/onboarding_screen.dart';

void main() async {
  Get.put<MovieRepository>(MovieRepositoryImpl());
  Get.put<MovieController>(MovieController());
   await FloorStorage.initDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a blue toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),

          useMaterial3: true,
          fontFamily: 'Poppins',
          textTheme: const TextTheme(
            displayMedium: TextStyle(
                //fontFamily: 'Poppins',
                fontSize: 16.0,
                fontWeight: FontWeight.w500),
            titleLarge: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.w500,
            ),
            bodySmall: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w600,
            ),
            bodyMedium: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        home: OnBoardingScreen());
  }
}
