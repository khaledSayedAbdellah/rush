library rush;

import 'package:flutter/material.dart';

enum RushScreenSize {large, medium, small}


class RushSetup{
        static late RushScreenSize _large, _medium, _small;
        static late final double startMediumSize, startLargeSize;

        static RushScreenSize get largeScreens => _large;
        static RushScreenSize get mediumScreens => _medium;
        static RushScreenSize get smallScreens => _small;


        static void init({
                RushScreenSize largeScreens = RushScreenSize.large,
                RushScreenSize mediumScreens = RushScreenSize.medium,
                RushScreenSize smallScreens = RushScreenSize.small,
                double startMediumSize = 768,
                double startLargeSize = 1200,
        }){
                _large = largeScreens;
                _medium = mediumScreens;
                _small = smallScreens;

                RushSetup.startMediumSize = startMediumSize;
                RushSetup.startLargeSize = startLargeSize;
        }


        static Size getSize({required Size largeSize,required Size mediumSize,required Size smallSize,required double maxWidth}){
                if (maxWidth <= RushSetup.startMediumSize) {
                        return _getSizeByRushType(RushSetup.smallScreens,largeSize: largeSize,mediumSize: mediumSize,smallSize: smallSize);
                }
                if (maxWidth <= RushSetup.startLargeSize && maxWidth > RushSetup.startMediumSize) {
                        return _getSizeByRushType(RushSetup.mediumScreens,largeSize: largeSize,mediumSize: mediumSize,smallSize: smallSize);
                }
                return _getSizeByRushType(RushSetup.largeScreens,largeSize: largeSize,mediumSize: mediumSize,smallSize: smallSize);

        }

        static Size _getSizeByRushType(RushScreenSize rushScreenSize,{required Size largeSize,required Size mediumSize,required Size smallSize,}) {
                switch(rushScreenSize){
                        case RushScreenSize.large: return largeSize;
                        case RushScreenSize.medium: return mediumSize;
                        case RushScreenSize.small: return smallSize;
                }
        }
}
