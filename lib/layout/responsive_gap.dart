import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'layout.dart';

class ResponsiveGap extends StatelessWidget {
  const ResponsiveGap({
    Key? key,
    this.small = 0,
    this.medium = 0,
    this.large = 0,
  }) : super(key: key);

  final double small;
  final double medium;
  final double large;

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(
      small: (_, __) => Gap(small),
      medium: (_, __) => Gap(medium),
      large: (_, __) => Gap(large),
      child: (_) => const SizedBox.shrink(),
    );
  }
}
