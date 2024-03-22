import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class ImageSlidePage extends StatefulWidget {
  const ImageSlidePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return ImageSlidePageState();
  }
}

class ImageSlidePageState extends State<ImageSlidePage> {
  late int _value;

  @override
  void initState() {
    super.initState();
    _value = 6;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Linear Progress Bar"),
        ),
        body: Swiper(
          itemBuilder: (context, index) {
            return Image.network(
              "https://img.freepik.com/premium-photo/lofi-music-chill-vibes-sunset-background-wallpaper_684882-324.jpg",
              height: 300,
            );
          },
          itemCount: 10,
          viewportFraction: 0.8,
          scale: 0.9,
          // itemWidth: 300,
          // layout: SwiperLayout.STACK,
        ));
  }
// this function updates the progress value
}
