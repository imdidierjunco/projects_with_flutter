import 'package:flutter/material.dart';

import 'package:all_flutter/facebook_ui/display/widgets/widgets.dart';

class WhatIsOnYourMind extends StatelessWidget {
  const WhatIsOnYourMind({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ).copyWith(top: 17),
      child: Row(
        children: const [
          Avatar(
            size: 70,
            assetLocation: 'assets/facebook_ui/users/1.jpg',
          ),
          SizedBox(
            width: 20,
          ),
          Flexible(
            child: Text(
              'What is on your mind, Didier?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
          )
        ],
      ),
    );
  }
}
