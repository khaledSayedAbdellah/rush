import 'package:flutter/material.dart';
import '../rush.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget? largeScreen;
  final Widget? mediumScreen;
  final Widget? smallScreen;

  const ResponsiveLayout(
      {Key? key,
        required this.largeScreen,
        this.mediumScreen,
        this.smallScreen})
      : super(key: key);




  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if(smallScreen == null && mediumScreen == null && largeScreen == null) {
          return const Center(child: Text("no screens available"));
        }
        if(!RushSetup.enableMediumScreens && !RushSetup.enableLargeScreens && !RushSetup.enableSmallScreens) {
          return const Center(child: Text("no screens available"));
        }
        if (constraints.maxWidth <= RushSetup.startMediumSize && RushSetup.enableSmallScreens) {
          return smallScreen ?? mediumScreen?? largeScreen ??const SizedBox();
        } else if (constraints.maxWidth <= RushSetup.startLargeSize && constraints.maxWidth > RushSetup.startMediumSize && RushSetup.enableMediumScreens) {
          return mediumScreen ?? largeScreen ?? smallScreen??const SizedBox();
        } else {
          if(constraints.maxWidth <= RushSetup.startMediumSize){
            if(RushSetup.enableMediumScreens && mediumScreen!=null) return mediumScreen!;
            if(RushSetup.enableLargeScreens && largeScreen!=null) return largeScreen!;
          }
          else if(constraints.maxWidth <= RushSetup.startLargeSize && constraints.maxWidth > RushSetup.startMediumSize){
            if(RushSetup.enableLargeScreens && largeScreen!=null) return largeScreen!;
            if(RushSetup.enableSmallScreens && smallScreen!=null) return smallScreen!;
          }
          else{
            if(RushSetup.enableLargeScreens && largeScreen!=null) return largeScreen!;
            if(RushSetup.enableMediumScreens && mediumScreen!=null) return mediumScreen!;
            if(RushSetup.enableSmallScreens && smallScreen!=null) return smallScreen!;
          }
          return const Center(child: Text("no screens available"));
        }
      },
    );
  }
}

abstract class ResponsiveStatelessMixin extends StatelessWidget {
  const ResponsiveStatelessMixin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        largeScreen: buildLargeScreen(context),
        mediumScreen: buildMediumScreen(context),
        smallScreen: buildSmallScreen(context),
      ),
    );
  }

  Widget buildLargeScreen(BuildContext context);
  Widget buildMediumScreen(BuildContext context);
  Widget buildSmallScreen(BuildContext context);
}

