import 'package:flutter/material.dart';

const double _kMyLinearProgressIndicatorHeight = 6.0;

// ignore: must_be_immutable
class WebviewProgressIndicator extends LinearProgressIndicator
    implements PreferredSizeWidget {
  WebviewProgressIndicator({
    Key? key,
    required double? value,
    required Color backgroundColor,
    required Animation<Color> valueColor,
  }) : super(
    key: key,
    value: value,
    backgroundColor: backgroundColor,
    valueColor: valueColor,
  ) {
    preferredSize = const Size(double.infinity, _kMyLinearProgressIndicatorHeight);
  }

  @override
  late Size preferredSize;
}