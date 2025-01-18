import 'package:flutter/material.dart';
import '../rush.dart';

class RushWidget extends StatelessWidget {
  final Widget? largeScreen;
  final Widget? mediumScreen;
  final Widget? smallScreen;

  const RushWidget({
    Key? key,
    this.largeScreen,
    this.mediumScreen,
    this.smallScreen,
  }) : super(key: key);


  Widget getScreenByRushType(RushScreenSize rushScreenSize) {
    switch(rushScreenSize){
      case RushScreenSize.large: return largeScreen ?? checkRushInit;
      case RushScreenSize.medium: return mediumScreen ?? checkRushInit;
      case RushScreenSize.small: return smallScreen ?? checkRushInit;
    }
  }

  static Widget get checkRushInit => const Center(child: Text("the providing screens not suitable for your rush.init method"));

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if(smallScreen == null && mediumScreen == null && largeScreen == null) {
          return const Center(child: Text("no screens available"));
        }
        if (constraints.maxWidth <= RushSetup.startMediumSize) {
          return getScreenByRushType(RushSetup.smallScreens);
        }
        if (constraints.maxWidth <= RushSetup.startLargeSize && constraints.maxWidth > RushSetup.startMediumSize) {
          return getScreenByRushType(RushSetup.mediumScreens);
        }
        if (constraints.maxWidth > RushSetup.startLargeSize) {
          return getScreenByRushType(RushSetup.largeScreens);
        }
        return const Center(child: Text("no screens available"));
      },
    );
  }
}
