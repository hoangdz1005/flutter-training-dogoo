
import 'package:flutter/material.dart';

@immutable
abstract class ColorEvent {}
class InitialEvent extends ColorEvent {
  InitialEvent();
}
class ColorToBlue extends ColorEvent {
  ColorToBlue();
}
class ColorToRed extends ColorEvent {
  ColorToRed();
}