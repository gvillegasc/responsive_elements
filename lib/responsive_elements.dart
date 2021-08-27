library responsive_elements;

import 'dart:math' as math;
import 'package:flutter/widgets.dart';

class ResponsiveElements {
  ResponsiveElements({
    required this.width,
    required this.height,
    required this.orientation,
    required this.inch,
  });

  factory ResponsiveElements.of(BuildContext context) {
    final data = MediaQuery.of(context);
    final size = data.size;
    final inch = math.sqrt(math.pow(size.width, 2) + math.pow(size.height, 2));
    final orientation = MediaQuery.of(context).orientation;
    return ResponsiveElements(
        width: size.width,
        height: size.height,
        orientation: orientation,
        inch: inch);
  }

  final double width;
  final double height;
  final double inch;
  final Orientation orientation;

  double widthR(double percent) {
    return width * percent / 100;
  }

  double heightR(double percent) {
    return height * percent / 100;
  }

  double inchR(double percent) {
    return inch * percent / 100;
  }

  double spR(double percent) {
    if (orientation == Orientation.landscape) {
      return (height / 3) * percent / 100;
    }
    return (width / 3) * percent / 100;
  }
}
