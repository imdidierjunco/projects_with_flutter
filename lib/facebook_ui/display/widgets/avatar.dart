import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final double size;
  final String assetLocation;

  const Avatar({
    Key? key,
    required this.size,
    required this.assetLocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          size * 0.5,
        ),
        child: Image.asset(
          assetLocation,
          width: size,
          height: size,
        ),
      ),
    );
  }
}
