import 'package:flutter/material.dart';

const double _kMyLinearProgressIndicatorHeight = 6;

// ignore: must_be_immutable
class WebviewProgressIndicator extends LinearProgressIndicator
    implements PreferredSizeWidget {
  WebviewProgressIndicator({
    super.key,
    required super.value,
    required Color super.backgroundColor,
    required Animation<Color> super.valueColor,
  }) {
    preferredSize = const Size(double.infinity, _kMyLinearProgressIndicatorHeight);
  }

  @override
  late Size preferredSize;
}