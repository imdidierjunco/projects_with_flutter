import 'package:all_flutter/facebook_ui/display/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../data/models/story.dart';

final List<Story> _stories = [
  Story(
    background: 'assets/facebook_ui/wallpapers/1.jpeg',
    avatar: 'assets/facebook_ui/users/1.jpg',
    userName: 'Didier Junco',
  ),
  Story(
    background: 'assets/facebook_ui/wallpapers/2.jpeg',
    avatar: 'assets/facebook_ui/users/2.jpg',
    userName: 'Rafael Urruchurto',
  ),
  Story(
    background: 'assets/facebook_ui/wallpapers/3.jpeg',
    avatar: 'assets/facebook_ui/users/3.jpg',
    userName: 'Junco',
  ),
  Story(
    background: 'assets/facebook_ui/wallpapers/4.jpeg',
    avatar: 'assets/facebook_ui/users/4.jpg',
    userName: 'David Pérez',
  ),
  Story(
    background: 'assets/facebook_ui/wallpapers/5.jpeg',
    avatar: 'assets/facebook_ui/users/5.jpg',
    userName: 'Marcela Pérez',
  ),
  Story(
    background: 'assets/facebook_ui/wallpapers/6.jpeg',
    avatar: 'assets/facebook_ui/users/6.jpg',
    userName: 'Didier Junco',
  )
];

class Stories extends StatelessWidget {
  const Stories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          final story = _stories[index];
          return StoryItem(
            story: story,
            isFirst: index == 0,
          );
        },
        itemCount: _stories.length,
      ),
    );
  }
}
