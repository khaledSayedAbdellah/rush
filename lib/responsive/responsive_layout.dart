import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../custom_widget.dart';

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
        if(!enableMediumScreens && !enableLargeScreens && !enableSmallScreens) {
          return const Center(child: Text("no screens available"));
        }
        if (constraints.maxWidth <= 768 && enableSmallScreens) {
          return smallScreen ?? mediumScreen?? largeScreen ??const SizedBox();
        } else if (constraints.maxWidth <= 1200 && constraints.maxWidth > 768 && enableMediumScreens) {
          return mediumScreen ?? largeScreen ?? smallScreen??const SizedBox();
        } else {
          if(constraints.maxWidth <= 768){
            if(enableMediumScreens && mediumScreen!=null) return mediumScreen!;
            if(enableLargeScreens && largeScreen!=null) return largeScreen!;
          }
          else if(constraints.maxWidth <= 1200 && constraints.maxWidth > 768){
            if(enableLargeScreens && largeScreen!=null) return largeScreen!;
            if(enableSmallScreens && smallScreen!=null) return smallScreen!;
          }
          else{
            if(enableLargeScreens && largeScreen!=null) return largeScreen!;
            if(enableMediumScreens && mediumScreen!=null) return mediumScreen!;
            if(enableSmallScreens && smallScreen!=null) return smallScreen!;
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

abstract class ResponsiveStateFullMixin extends StatefulWidget {
  const ResponsiveStateFullMixin({Key? key}) : super(key: key);
}

abstract class ResponsiveStateFullMixinState<T extends StatefulWidget> extends StateMVC<T> {
  ResponsiveStateFullMixinState(super.controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  ResponsiveLayout(
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

