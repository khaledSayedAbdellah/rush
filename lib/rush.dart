library rush;


class RushSetup{
        static bool? _enableLarge, _enableMedium, _enableSmall;
        static late final double startMediumSize, startLargeSize;

        static bool get enableLargeScreens => _enableLarge??true;
        static bool get enableMediumScreens => _enableMedium??true;
        static bool get enableSmallScreens => _enableSmall??true;


        static void init({bool enableLargeScreens = true,bool enableMediumScreens = true,bool enableSmallScreens = true,
                double startMediumSize = 768, double startLargeSize = 1200,}){
                _enableLarge = enableLargeScreens;
                _enableMedium = enableMediumScreens;
                _enableSmall = enableSmallScreens;

                RushSetup.startMediumSize = startMediumSize;
                RushSetup.startLargeSize = startLargeSize;
        }
}
