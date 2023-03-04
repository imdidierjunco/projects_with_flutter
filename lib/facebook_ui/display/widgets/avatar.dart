import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
    final bool fromNetwork = assetLocation.startsWith('http://') ||
        assetLocation.startsWith('https://');
    final imagenProvider = fromNetwork
        ? CachedNetworkImageProvider(assetLocation)
        : AssetImage(
            assetLocation,
          );

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
          image: imagenProvider as ImageProvider,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
