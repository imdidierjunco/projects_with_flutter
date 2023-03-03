import 'package:all_flutter/facebook_ui/data/models/publication.dart';
import 'package:all_flutter/facebook_ui/display/widgets/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:timeago/timeago.dart' as timeago;

class PublicationItem extends StatelessWidget {
  const PublicationItem({
    Key? key,
    required this.publications,
  }) : super(key: key);
  final Publications publications;

  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.symmetric(
      horizontal: 20.0,
      vertical: 15,
    );
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: padding,
            child: Row(
              children: [
                const Avatar(
                  size: 45,
                  assetLocation: 'assets/facebook_ui/users/1.jpg',
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(publications.user.userName),
                const Spacer(),
                Text(
                  timeago.format(publications.createPost),
                )
              ],
            ),
          ),
          CachedNetworkImage(
            imageUrl: publications.imageUrl,
            height: 280,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: padding.copyWith(left: 0),
            child: Text(
              publications.title,
              textAlign: TextAlign.left,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
