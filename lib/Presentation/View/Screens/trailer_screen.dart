import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../Controller/movie_controller.dart';

class TrailerScreen extends StatefulWidget {
  const TrailerScreen({super.key, required this.movieId});
  final int movieId;

  @override
  State<TrailerScreen> createState() => _TrailerScreenState();
}

class _TrailerScreenState extends State<TrailerScreen> {
  late YoutubePlayerController _controller;
  bool isLoading = true;
  final movieController = Get.find<MovieController>();
  bool isError = false;
  @override
  void initState() {
    super.initState();
    movieController.fetchVideo(widget.movieId).then((value) {
      value.fold((video) {
        _controller = YoutubePlayerController(
          initialVideoId: video,
          flags: const YoutubePlayerFlags(
            autoPlay: false,
            mute: false,
          ),
        );
      }, (error) {
        print('error: ' + error.toString());
        setState(() {
          isError = true;
        });
      });
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void checkVideo() {
    // Implement your calls inside these conditions' bodies :

    // if (_controller.value.position == _controller.value.duration) {
    //   print('video Ended');
    //   Get.back();
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Watch",
        ),
      ),
      body: Container(child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        if (isLoading) {
          return Lottie.asset('assets/animations/loading.json');
        } else if (isError) {
          return Center(
            child: Text(
              "Unknown Error!",
              style: Theme.of(context).textTheme.displayMedium,
            ),
          );
        } else {
          return YoutubePlayerBuilder(
              player: YoutubePlayer(
                controller: _controller,
                onEnded: (data) {
                  Get.back();
                },
              ),
              builder: (context, player) {
                return Column(
                  children: [
                    // some widgets
                    player,
                    //some other widgets
                  ],
                );
              });
        }
      })),

      // Center(
      //   child: _controller.value.isInitialized
      //       ? RotatedBox(
      //           quarterTurns: 1,
      //           child: AspectRatio(
      //             aspectRatio: MediaQuery.of(context).size.height /
      //                 MediaQuery.of(context)
      //                     .size
      //                     .width, //_controller.value.aspectRatio,
      //             child: VideoPlayer(_controller),
      //           ),
      //         )
      //       : Lottie.asset('assets/animations/loading.json'),
      // ),
    );
  }
}
