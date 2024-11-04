import 'package:flutter/material.dart';
import 'package:news_app/Pages/bookmarkPage/videoplayer.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('News Videos'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SamplePlayer(
                  videourl:
                      "https://res.cloudinary.com/dqkgm7wuy/video/upload/v1730671783/video2_tgnial.mp4"),
              // const SizedBox(
              //   height: 5,
              // ),
              // SamplePlayer(
              //     videourl:
              //         "https://res.cloudinary.com/dqkgm7wuy/video/upload/v1730671759/video3_ndqzag.mp4"),
              // const SizedBox(
              //   height: 5,
              // ),
              // SamplePlayer(
              //     videourl:
              //         "https://res.cloudinary.com/dqkgm7wuy/video/upload/v1730671728/video5_uoxyzv.mp4"),
              // const SizedBox(
              //   height: 5,
              // ),
              // SamplePlayer(
              //     videourl:
              //         "https://res.cloudinary.com/dqkgm7wuy/video/upload/v1730671652/video4_z8yrqw.mp4"),
              // const SizedBox(
              //   height: 5,
              // ),
              // SamplePlayer(
              //     videourl:
              //         "https://res.cloudinary.com/dqkgm7wuy/video/upload/v1730671643/video1_qygwza.mp4"),
              // const SizedBox(
              //   height: 5,
              // ),
              // SamplePlayer(
              //     videourl:
              //         "https://res.cloudinary.com/dqkgm7wuy/video/upload/v1730671639/video6_u5o1zb.mp4"),
            ],
          ),
        ));
  }
}
