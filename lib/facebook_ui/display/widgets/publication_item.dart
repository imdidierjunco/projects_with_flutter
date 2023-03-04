import 'package:all_flutter/facebook_ui/data/models/publication.dart';
import 'package:all_flutter/facebook_ui/display/widgets/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

    const reactions = Emoji.values;

    String _getEmojiPath(Emoji reaction) {
      switch (reaction) {
        case Emoji.like:
          return 'assets/facebook_ui/emojis/like.svg';
        case Emoji.love:
          return 'assets/facebook_ui/emojis/heart.svg';
        case Emoji.laughing:
          return 'assets/facebook_ui/emojis/laughing.svg';
        case Emoji.shocking:
          return 'assets/facebook_ui/emojis/shocked.svg';
        case Emoji.sad:
          return 'assets/facebook_ui/emojis/sad.svg';
        case Emoji.angry:
          return 'assets/facebook_ui/emojis/angry.svg';
      }
    }

    String _formatCount(int value) {
      if (value <= 1000) {
        return value.toString();
      } else {
        return '${(value / 1000).toStringAsFixed(1)}k';
      }
    }

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 6,
            color: Color(0xffEBEBEB),
          ),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: padding,
            child: Row(
              children: [
                Avatar(
                  size: 45,
                  assetLocation: publications.imageUrl,
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
          AspectRatio(
            aspectRatio: 18 / 10,
            child: CachedNetworkImage(
              imageUrl: publications.imageUrl,
              height: 280,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: padding.copyWith(left: 0),
            child: Text(
              publications.title,
              textAlign: TextAlign.start,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ...List.generate(
                      reactions.length,
                      (index) {
                        final Emoji reaction = reactions[index];
                        final bool isActive =
                            reaction == publications.currentUseReaction;
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                _getEmojiPath(reaction),
                                width: 30,
                                height: 30,
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Icon(
                                Icons.circle,
                                color: isActive ? Colors.red : Colors.white,
                                size: 6,
                              )
                            ],
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                  ],
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 10.0,
                    ),
                    child: FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '${_formatCount(publications.commentCount)} Comments',
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            '${_formatCount(publications.shareCount)} Shares',
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
