import 'package:flutter/material.dart';


///All common properties
///for widgets
class WidgetConfig{
  WidgetConfig._();
  static  final WidgetConfig _instance = WidgetConfig._();
  factory WidgetConfig()=> _instance;

  EdgeInsets pagePadding = const EdgeInsets.symmetric(horizontal: 16);
}