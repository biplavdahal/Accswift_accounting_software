import 'package:accswift/resources/resources.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double? size;
  final Color? color;

  const Logo({
    Key? key,
    this.size,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'app-logo',
      child: Image.asset(
        Images.accSwiftLogo,
        height: size,
      ),
    );
  }
}
