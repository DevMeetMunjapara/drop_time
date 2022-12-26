import 'dart:ui';

import 'package:drop_time/pages/introScreen/intro1.dart';
import 'package:drop_time/pages/introScreen/intro2.dart';
import 'package:drop_time/pages/introScreen/intro3.dart';
import 'package:drop_time/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LiquidSwipe(
        pages: Pages,
        enableLoop: false,
        slideIconWidget: Icon(
          Icons.arrow_back_ios,
          size: 40,
        ),
        waveType: WaveType.liquidReveal,
        positionSlideIcon: 0.5,
      ),
    );
  }

  final Pages = [
    Intro1(),
    Intro2(),
    Intro3(),
  ];
}
