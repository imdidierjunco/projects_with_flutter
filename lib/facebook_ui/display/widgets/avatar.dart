import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final double size;
  final String assetLocation;
  final double borderWidth;

  const Avatar({
    Key? key,
    required this.size,
    required this.assetLocation,
    this.borderWidth = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: borderWidth,
          color: Colors.white,
        ),
        image: DecorationImage(
          image: AssetImage(
            assetLocation,
          ),
        ),
      ),
    );
  }
}
