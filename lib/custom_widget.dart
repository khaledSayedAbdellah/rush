library custom_widget;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Checkbox;

part 'widgets/checkboxWidget/checkbox.dart';


bool? _enableLarge;
bool? _enableMedium;
bool? _enableSmall;

bool get enableLargeScreens => _enableLarge??true;
bool get enableMediumScreens => _enableMedium??true;
bool get enableSmallScreens => _enableSmall??true;

void customWidgetSetUp({bool enableLargeScreens = true,bool enableMediumScreens = true,bool enableSmallScreens = true,}){
        _enableLarge = enableLargeScreens;
        _enableMedium = enableMediumScreens;
        _enableSmall = enableSmallScreens;
}
